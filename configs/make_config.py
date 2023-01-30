import itertools
import json
import os

model_name_or_path = [
    ("tscholak/1zha5ono", "t5base"),
    ("tscholak/3vnuv1vf", "t5large"),
    ("tscholak/2jrayxos", "t5large+cosql"),
]
num_beams = [2, 4, 8]
picard_max_tokens_to_check = [2]
picard_mode = [
    "lex",
    # "parse_without_guards",
    "parse_with_guards",
]
gold_file = [
    "dev_pig_specific.sql",
    "dev_pig_not_specific.sql",
    "dev_pig_specific_and_not_specific.sql",
    "dev_spider_plus_pig_specific.sql",
    "dev_spider_plus_pig_not_specific.sql",
    "dev_spider_plus_pig_specific_and_not_specific.sql",
]
gold_file = ["gold_v1.sql"]

# Load the JSON file
with open("configs/eval.json") as json_file:
    config = json.load(json_file)

for mdl, nb, pmttc, mode, gold in itertools.product(
    model_name_or_path, num_beams, picard_max_tokens_to_check, picard_mode, gold_file
):
    config["model_name_or_path"] = mdl[0]
    config["num_beams"] = nb
    config["picard_max_tokens_to_check"] = pmttc
    config[
        "run_name"
    ] = f"{mdl[1]}-{mode}-{pmttc}tk{nb}bm-{gold.split('.')[0].replace('dev_','').replace('_plus_','_')}"
    config["output_dir"] = f'/eval/{config["run_name"]}'
    config["picard_mode"] = mode
    config["max_val_samples"] = 1300
    # config["gold_file"] = gold
    # if "spider" in gold:
    #     config["tables_file"] = "tables.json"

    path = "configs/seoss/"
    os.makedirs(path, exist_ok=True)
    with open(f'{path}/{config["run_name"]}.json', "w") as outfile:
        json.dump(config, outfile)
    # subprocess.run(["python", "eval.py", f'{config["run_name"]}.json'])
