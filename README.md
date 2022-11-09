
# E-commerce data assistant: Injecting knowledge in seq2seq SQL generation

This code is based on:

```bibtex
@inproceedings{Scholak2021:PICARD,
  author = {Torsten Scholak and Nathan Schucher and Dzmitry Bahdanau},
  title = "{PICARD}: Parsing Incrementally for Constrained Auto-Regressive Decoding from Language Models",
  booktitle = "Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing",
  month = nov,
  year = "2021",
  publisher = "Association for Computational Linguistics",
  url = "https://aclanthology.org/2021.emnlp-main.779",
  pages = "9895--9901",
}
```

### Prerequisites

This repository uses git submodules. Clone it like this:
```sh
git clone --recurse-submodules https://github.com/totem37/docu-t5.git
```

Install Docker on Ubuntu with:
```
cd docu-t5
./install_docker.sh
```

Pull the DocuT5 Docker image with:
```
make pull-eval-image
```

Alternatively, you can build the DocuT5 image from scratch. This is necessary if changes have been made to the model. To do this run:
```
make build-eval-image
```

### Training

The training script is located in `seq2seq/run_seq2seq.py`.

Configuration files are located in `configs/`.

Run training with:
```
make train
```
This puts you in a Docker image, in which you can run:
```
python seq2seq/run_seq2seq.py configs/train.json
```
Replace `train.json` with whatever config file you want to run.

The model will be trained on the Spider dataset by default. 

To run it on Datasaur, change in configs/train.json the field 'model-name-or-path' to 'datasaur'

To enable Foreign Keys Serialization, set in the same config file to 'schema_serialization_with_foreign_keys' to true

To enable Schema Augumentation, set in the same config file to 'schema_serialization_with_db_description' to true

For long runs, run the training in the background with:
```
wandb login
nohup python seq2seq/run_seq2seq.py configs/train.json &
```
This logs output to `nohup.out`. You can exit the Docker container and close the terminal if you use nohup.

To re-enter the last exited Docker container run:
```
docker start `docker ps -q -l` && docker attach `docker ps -q -l`
```

### Evaluation

If you want a full evaluation of Spider, first run:
```
./download_datasets.sh
```

The evaluation script is located in `seq2seq/run_seq2seq.py`.

Configuration files are located in `configs/`.

Run evaluation with:
```
make eval
```
This puts you in a Docker image, in which you can run:
```
python seq2seq/run_seq2seq.py configs/eval.json
```
Replace `eval.json` with whatever config file you want to run.

Pre-trained models are available on HuggingFace at https://huggingface.co/elena-soare.

To enable Foreign Keys Serialization, set "schema_serialization_with_foreign_keys" to true and add the corresponding model to the Huggingface fine-tuned model 'elena-soare/bat-fk-base'

To run the Pre-trained E-commerce model, leave the baseline configurations and set the model name or path to the Huggingface checkpoint 'elena-soare/bat-pre-trained'

To enable Schema Augumentation, set "schema_serialization_with_db_description" to true and the corresponding model to the Huggingface fine-tuned model 'elena-soare/docu-t5-large-SD'

For long runs, run the evaluation in the background with:
```
wandb login
nohup python seq2seq/run_seq2seq.py configs/eval.json &
```
This logs output to `nohup.out`. You can exit the Docker container and close the terminal if you use nohup.

To re-enter the last exited Docker container run:
```
docker start `docker ps -q -l` && docker attach `docker ps -q -l`
```

### Serving

A trained model can be served using the `seq2seq/serve_seq2seq.py` script.

The configuration file can be found in `configs/serve.json`.

You can start serving with:
```
make serve
```

### Pre-training Script
Pre-training script is located in /picard/pre-training/script.ipynb. You need to set the file with crawled data (https://huggingface.co/datasets/elena-soare/crawled-ecommerce/blob/main/train.json) within the same directory to run the code.

The files used to crawl e-commerce Common Crawl data are in /picard/pre-training/crawling_data/. To run it, you would need an AWS account, set up AWS Athena columnar index (https://skeptric.com/common-crawl-index-athena/ -> tutorial). And obtain a file with the Authentication Credentials.

Build virtualenv and install requirements:
```
pip3 install -r requirements 
```
Paste `credentials.csv` into `complex_task_search` parent directory for AWS credentials (region should be `us-east-1` 
to be co-located with common crawl data). Format:
```
Access key ID,Secret access key,staging path,region
XXX,YYY,ZZZ,us-east-1
```

The function run_build_corpus() in common_crawl.py should connect to AWS Athena and crawl the data.
To convert html pages to text and santize the crawled data, you can find the code in html_to_text.py.



