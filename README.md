
# SEOSS-Queries - a Software Engineering Dataset for Text-to-SQL and Question Answering Tasks

This project is based on this dataset:

```bibtex
@article{article,
author = {Tomova, Mihaela and Hofmann, Martin and Mäder, Patrick},
year = {2022},
month = {04},
pages = {108211},
title = {SEOSS-Queries - a Software Engineering Dataset for Text-to-SQL and Question Answering Tasks},
volume = {42},
journal = {Data in Brief},
doi = {10.1016/j.dib.2022.108211}
}
```

Also This code is developed on top of PICARD:

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
git clone --recurse-submodules https://github.com/yazdipour/yazdipour/text-to-sql-seoss-t5.git
```

Install Docker on Ubuntu with: `./install_docker.sh`

Download the required datasets: `./download_datasets.sh`

Pull the DocuT5 Docker image with: `make pull-eval-image`

Alternatively, you can build the DocuT5 image from scratch. This is necessary if changes have been made to the model. To do this run: `make build-eval-image`

### Training

The training script is located in `seq2seq/run_seq2seq.py`.

Configuration files are located in `configs/`.

Run training with: `make train`

This puts you in a Docker image, in which you can run: `python seq2seq/run_seq2seq.py configs/train.json`

Replace `train.json` with whatever config file you want to run.

The model will be trained on the Spider dataset by default. 

To run it on seoss, change in configs/train.json the field 'model-name-or-path' to 'seoss'

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

## Upload Trained Model to HuggingFace

To upload a new trained model to HuggingFace, execute the following commands _before_ training (note that MODEL_NAME should be the same as the subdirectory of train specified in the output_dir argument in the training config):
```
huggingface-cli login
apt install git-lfs
cd train
git lfs install
huggingface-cli repo create [MODEL_NAME]
git clone https://huggingface.co/[HUGGINGFACE_USERNAME]/[MODEL_NAME]
huggingface-cli lfs-enable-largefiles [MODEL_NAME]
```

To push changes to an existing HuggingFace model repository, run the following commands after training:
```
huggingface-cli login
cd train
python push.py [MODEL_NAME]
```

### Evaluation

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

To run the Pre-trained model, leave the baseline configurations and set the model name or path to the Huggingface checkpoint 'elena-soare/bat-pre-trained'

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