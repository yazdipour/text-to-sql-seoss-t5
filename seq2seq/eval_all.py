# # Set up logging
# import sys
# import logging

# logging.basicConfig(
#     format="%(asctime)s - %(levelname)s - %(name)s -   %(message)s",
#     datefmt="%m/%d/%Y %H:%M:%S",
#     handlers=[logging.StreamHandler(sys.stdout)],
#     level=logging.WARNING,
# )
# logger = logging.getLogger(__name__)

# import os
# import json
# from pathlib import Path
# from contextlib import nullcontext
# from dataclasses import asdict, fields
# from transformers.hf_argparser import HfArgumentParser
# from transformers.training_args_seq2seq import Seq2SeqTrainingArguments
# from transformers.models.auto import AutoConfig, AutoTokenizer, AutoModelForSeq2SeqLM
# from transformers.data.data_collator import DataCollatorForSeq2Seq
# from transformers.trainer_utils import get_last_checkpoint, set_seed
# from transformers.models.t5.modeling_t5 import T5ForConditionalGeneration
# from transformers.models.t5.tokenization_t5_fast import T5TokenizerFast
# from transformers.tokenization_utils_fast import PreTrainedTokenizerFast
# from tokenizers import AddedToken
# from seq2seq.utils.args import ModelArguments
# from seq2seq.utils.picard_model_wrapper import PicardArguments, PicardLauncher, with_picard
# from seq2seq.utils.dataset import DataTrainingArguments, DataArguments
# from seq2seq.utils.dataset_loader import load_dataset
# from seq2seq.utils.spider import SpiderTrainer
# from seq2seq.utils.cosql import CoSQLTrainer
from seq2seq.run_seq2seq import run
import json
results = {}

def main():

    for type in ["lex", "parse_without_guards", "parse_with_guards"]:
        for beam in [1,2,3,4,5,6,7,8]:
            with open("configs/eval.json", "r") as jsonFile:
                data = json.load(jsonFile)
                print(data)
                data["run_name"] += "_beam" + str(beam) + "_mode_"+ str(type)
                data["num_beams"] = beam
                data["picard_mode"] = type
            with open("configs/eval.json", "w") as jsonFile:
                json.dump(data, jsonFile)
            run()
            

if __name__ == "__main__":
    main()
