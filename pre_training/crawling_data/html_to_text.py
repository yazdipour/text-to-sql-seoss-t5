import boilerpy3
import os
import re
from boilerpy3 import extractors
from c4_utils import clean_page
import json
import ast  

# Condenses all repeating newline characters into one single newline character
def condense_newline(text):
    return '\n'.join([p for p in re.split('\n|\r', text) if len(p) > 0])

# Returns the text from a HTML file
def parse_html(html):
    # Text extraction with boilerpy3
    html_extractor = extractors.ArticleExtractor()
    return condense_newline(html_extractor.get_content(html))

# Extracts the text from all html files in a specified directory
def html_to_text(folder):
    parsed_texts = []
    filepaths = os.listdir(folder)

    for filepath in filepaths:
        filepath_full = os.path.join(folder, filepath)
        if filepath_full.endswith(".html"):
            parsed_texts.append(parse_html(filepath_full))
    return parsed_texts

# Your directory to the folder with scraped websites



files = ['html0.json', 'html1.json', 'html2.json', 'html3.json', 'html4.json', 'html5.json', 'html6.json', 'html7.json', 'html8.json', 'html9.json',
'html10.json', 'html11.json', 'html12.json', 'html13.json']
count_pages = 0
error_documents= []
count = 0
with open ("crawled_data.json", "w") as f:
	json.dump({"version": "0.1.0", "data": []}, f)

all_pages = {"version": "0.1.0", "data": []}

for file in files:
	with open(file) as json_file:
		data = json_file.read().split('\n')
		for page in data:

			print(count_pages)
	    	
			try:
				page = ast.literal_eval(page)
			except Exception:
				count+= 1
				continue

			print(page['metadata']['url'])
			try:
				text = clean_page(parse_html(page['html']))
				count_pages += 1
				words = text.split(" ")
				i = 0
				if len(words)> 330:
					print("un exemplu cand s desperte data.....")
					print(text)
					print("-----------------------")

				while i<len(words):
					end = i+330 if (i+330<=len(words)) else len(words) 
					all_pages['data'].append({"metadata":page['metadata'], "text":" ".join(words[i:end])})
					i += 330
					

			except Exception:
				error_documents.append(page['metadata']['url'])
				continue

with open ("crawled_data.json", "w") as f:
	json.dump(all_pages, f)
	    	
print(error_documents)
print("Errors in cleaning the html to text" + str(len(error_documents)))
print("Errors while parsing" + str(count))

with open ("crawled_data.json", "r") as f:
	json.load(f)