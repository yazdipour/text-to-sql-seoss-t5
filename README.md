
E-commerce data assistant: Injecting knowledge in seq2seq SQL generation

This code is based on:

```bibtex
@inproceedings{Scholak2021:PICARD,
  author = {Torsten Scholak and Nathan Schucher and Dzmitry Bahdanau},
  title = {PICARD - Parsing Incrementally for Constrained Auto-Regressive Decoding from Language Models},
  booktitle = {Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing},
  year = {2021},
  publisher = {Association for Computational Linguistics},
}
```

### Prerequisites

This repository uses git submodules. Clone it like this:
```sh
$ git clone git@github.com:elena-soare/picard.git
$ cd picard
$ git submodule update --init --recursive
$ make build-eval-image
```

### Training

The training script is located in `seq2seq/run_seq2seq.py`.
You can run it with:
```
$ make train
```
The model will be trained on the Spider dataset by default.
To run it on Datasaur, change in configs/train.json the field 'model-name-or-path' to 'datasaur'
To enable Foreign Keys Serialization, set "schema_serialization_with_foreign_keys" to true
To enable Schema Augumentation, set "schema_serialization_with_db_description" to true

### Evaluation

The evaluation script is located in `seq2seq/run_seq2seq.py`.
You can run it with:
```
$ make eval
```
By default, the evaluation will be run on the Spider evaluation set.
The default configuration is stored in `configs/eval.json`.
To enable Foreign Keys Serialization, set "schema_serialization_with_foreign_keys" to true & add the corresponding model to the Huggingface fine-tuned model
To run the Pre-trained E-commerce model, leave the baseline configurations and set the model name or path to the Huggingface checkpoint
To enable Schema Augumentation, set "schema_serialization_with_db_description" to true & the corresponding model to the Huggingface fine-tuned model

### Serving

A trained model can be served using the `seq2seq/serve_seq2seq.py` script.
The configuration file can be found in `configs/serve.json`.
You can start serving with:
```
$ make serve
```
