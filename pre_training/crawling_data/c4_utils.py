# coding=utf-8
# Copyright 2022 The TensorFlow Datasets Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Utilities for generating the C4 dataset."""

import functools
import gzip
import hashlib
import heapq
import io
import re
import threading

import tensorflow as tf
import tensorflow_datasets.public_api as tfds

# WET file constants
_PAGE_DELIMITER = "WARC/1.0"
_URL_KEY = "WARC-Target-URI:"
_URL_DATE = "WARC-Date:"
_CONTENT_TYPE = "Content-Type:"
_CONTENT_LEN = "Content-Length:"
_METADATA_PREFIXES = ("WARC", "CONTENT-", "Content-")

# Filters
_MIN_WORDS_PER_LINE = 5
_MIN_NUM_SENTENCES = 3
_MAX_WORD_LENGTH = 1000
_END_MARKS = (".", "?", "!", "\"")
_ELLIPSIS = "..."
_POLICY_SUBSTRINGS = [
    "terms of use", "privacy policy", "cookie policy", "uses cookies",
    "use of cookies", "use cookies"
]

# Memoized sentence tokenizer.
_SENTENCE_TOKENIZER = None

UNKNOWN_LANGUAGE = "und"


def get_counter_inc_fn(namespace):

  def counter_inc_fn(counter, amt=1):
    tfds.core.lazy_imports.apache_beam.metrics.Metrics.counter(
        namespace, counter).inc(amt)

  return counter_inc_fn


def get_hashed_url_filter_fn(predicate_fn):

  def filter_fn(el):
    url, _ = el
    val = int(
        hashlib.md5(tf.compat.as_text(url).encode("utf-8")).hexdigest(), 16)
    return predicate_fn(val)

  return filter_fn


_nltk_lock = threading.Lock()


def _load_sentence_tokenizer():
  """Returns a sentence tokenization function."""
  nltk = tfds.core.lazy_imports.nltk
  # Lock to avoid a race-condition in the creation of the download directory.
  with _nltk_lock:
    nltk.download("punkt")
    return nltk.data.load("nltk:tokenizers/punkt/english.pickle")




def _get_sentences(text):
  global _SENTENCE_TOKENIZER
  if not _SENTENCE_TOKENIZER:
    _SENTENCE_TOKENIZER = _load_sentence_tokenizer()
  return list(_SENTENCE_TOKENIZER.tokenize(tf.compat.as_text(text)))


# Global lock used for language detection modules that aren't threadsafe.
langdetect_lock = threading.Lock()


def detect_english(page, min_probability=0.99):
  """Yields page iff text is 'en' with at least `min_probability`."""
  url, features = page
  text = features["text"]

  counter_inc_fn = get_counter_inc_fn("english-filter")

  langdetect = tfds.core.lazy_imports.langdetect
  # Make langdetect predictions deterministic.
  with langdetect_lock:
    langdetect.DetectorFactory.seed = 0
    try:
      predictions = langdetect.detect_langs(text)
    except langdetect.lang_detect_exception.LangDetectException:
      counter_inc_fn("filtered:langdetect_exception")
      return
  if not predictions:
    counter_inc_fn("filtered:no_predictions")
    return
  best_prediction = predictions[0]
  if best_prediction.prob < min_probability:
    counter_inc_fn("filtered:low_confidence")
    return
  if best_prediction.lang != "en":
    counter_inc_fn("filtered:ignored_language")
    counter_inc_fn("filtered:ignored_language-%s" % (best_prediction.lang,))
    return

  counter_inc_fn("passed")
  features = dict(features)
  features["language"] = "en"
  yield url, features




def get_clean_page_fn():
  """Returns `clean_page` with pre-compiled badword and citation regexes."""
  # Used to filter citation from Wikipedia pages (among others).
  citation_regex = re.compile(r"\[\d*\]|\[edit\]|\[citation needed\]")
  return functools.partial(clean_page, citation_regex=citation_regex)


def clean_page(text,
               counter_inc_fn=None,
              
               min_words_per_line=_MIN_WORDS_PER_LINE,
               min_num_sentences=_MIN_NUM_SENTENCES,
               max_word_length=_MAX_WORD_LENGTH):
  """Cleans a CommonCrawl page, yielding nothing if it should be skipped.
  Cleaning removes lines with no end marks or with too few words. After line
  filtering, pages are filtered out if they have too few sentences based on a
  simple count of end marks.
  Args:
    url_and_features: tuple(string, dict), the url and features of the page.
    citation_regex: Regex to use for finding Wikipedia-like citations to filter.
    counter_inc_fn: function, a function taking the name of a counter to be
      incremented and the (optional) amount. Defaults to a beam Metric counter.
    min_words_per_line: int, the minimum number of words a line needs to not be
      removed.
    min_num_sentences: int, the minimum number of sentences a page needs to not
      be skipped.
    max_word_length: int, the maximum number of characters allowed in a word.
      Lines containing a word with too many characters are removed.
  Yields:
    The url and cleaned text for the page.
  """


  if not counter_inc_fn:
    counter_inc_fn = get_counter_inc_fn("clean-page")

  lines = text.splitlines()
  valid_lines = []
  num_sentences = 0
  citation_regex = re.compile(r"\[\d*\]|\[edit\]|\[citation needed\]")
  def line_has_too_long_word(line):
    for word in line.split():
      if len(word) > max_word_length:
        return True
    return False

  for line in lines:
    line = line.strip()
    if line_has_too_long_word(line):
      counter_inc_fn("line-filtered:too_long_word")
      continue
    line = citation_regex.sub("", line)
    if not line.endswith(_END_MARKS) or line.endswith(_ELLIPSIS):
      counter_inc_fn("line-filtered:no_endmark")
      continue
    if len(line.split()) < min_words_per_line:
      counter_inc_fn("line-filtered:too_short")
      continue
    line_lower = line.lower()
    # Remove documents which contain lorem ipsum
    if "lorem ipsum" in line_lower:
      counter_inc_fn("filtered:loremipsum")
      return
    # Remove "javascript must be enabled" notices
    if "javascript" in line_lower:
      counter_inc_fn("line-filtered:javascript")
      continue
    # Remove docs which probably contain javascript code
    if "{" in line:
      counter_inc_fn("filtered:squigglybracket")
      return
    # Remove policy lines
    if any(p in line_lower for p in _POLICY_SUBSTRINGS):
      counter_inc_fn("line-filtered:policy")
      continue
    num_sentences += len(_get_sentences(line))
    valid_lines.append(line)
    counter_inc_fn("line-passed")

  if num_sentences < min_num_sentences:
    counter_inc_fn("filtered:too_few_sentences")
    return
  counter_inc_fn("passed")
  return " ".join(valid_lines).strip()


def _hash_text(text):
  return hashlib.md5(tf.compat.as_text(text).encode("utf-8")).hexdigest()


def _emit_url_to_lines(page):
  """Emits url to all (lower-cased, hashed) lines."""
  url, features = page
  text = features["text"]
  for line in text.split("\n"):
    yield _hash_text(line.strip().lower()), url


def _remove_lines_from_text(el, counter_inc_fn, min_num_sentences):
  """Removes all lines from the page that do not match the given set of hashes.
  Process the result of a join containing a single value for 'features' and zero
  or more values for 'lines'. Each value in 'lines' is a lower-cased, hashed
  line that has been selected to keep.
  Args:
    el: `(string, {'features': features_dict, 'lines': [string]})`, element
      containing the result of a join on key with both the page text and
      lower-cased, hashed lines to remove.
    counter_inc_fn: function, a function taking the name of a counter to be
      incremented and the (optional) amount.
    min_num_sentences: int, the minimum number of sentences a page needs to not
      be skipped.
  Yields:
    url: The URL of the page.
    features: The page features with lines removed from text.
  """
  url, join_values = el
  features = join_values["features"]

  assert len(features) == 1, "Invalid page count (%d) for %s" % (len(features),
                                                                 url)
  features = features[0]
  text = features["text"]
  lines_to_keep = set(join_values["lines"])
  new_lines = []
  hashed_lines = set()
  for line in text.split("\n"):
    hashed_line = _hash_text(line.strip().lower())
    if hashed_line not in lines_to_keep:
      counter_inc_fn("line-filtered:global_duplicate")
    elif hashed_line in hashed_lines:
      counter_inc_fn("line-filtered:local_duplicate")
    else:
      counter_inc_fn("line-passed")
      new_lines.append(line)
      hashed_lines.add(hashed_line)
  new_text = "\n".join(new_lines)
  print(new_text)
  if not new_text:
    counter_inc_fn("filtered:empty")
    return
  if min_num_sentences and len(_get_sentences(new_text)) < min_num_sentences:
    counter_inc_fn("filtered:too_few_sentences")
    return
  counter_inc_fn("passed")
  new_features = features.copy()
  new_features["text"] = new_text
  return new_text


def paragraph_filter(text, min_paragraphs=3, min_paragraph_len=200):
  """Returns False iff a page has too few or too short paragraphs."""

  lines = text.split("\n")
  # Filter out docs that don't have at least three "paragraphs"
  # (lines >= `min_paragraph_len` chars).
  if (len(lines) < min_paragraphs or
      min(heapq.nlargest(3, [len(l) for l in lines])) < min_paragraph_len):
    get_counter_inc_fn("paragraph-filter")("filtered")
    return False
  get_counter_inc_fn("paragraph-filter")("passed")
  return True