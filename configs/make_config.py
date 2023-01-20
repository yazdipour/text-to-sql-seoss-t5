import itertools
import json
import subprocess

model_name_or_path = [
    ("tscholak/1zha5ono", "t5-lm100k-base"),
    ("tscholak/3vnuv1vf", "t5-lm100k-large"),
    ("tscholak/2jrayxos", "t5-lm100k-large"),
]
num_beams = [1, 2, 4]
picard_max_tokens_to_check = [2]

# Load the JSON file
with open("configs/seoss/eval.json") as json_file:
    config = json.load(json_file)

for mdl, nb, pmttc in itertools.product(model_name_or_path, num_beams, picard_max_tokens_to_check):
    config["model_name_or_path"] = mdl[0]
    config["num_beams"] = nb
    config["picard_max_tokens_to_check"] = pmttc
    config["run_name"] = f"eval-{mdl[1]}-{pmttc}token-{nb}beams"
    config["output_dir"] = f'/{config["run_name"]}'
    with open(f'configs/seoss/{config["run_name"]}.json', "w") as outfile:
        json.dump(config, outfile)
    # subprocess.run(["python", "eval.py", f'{config["run_name"]}.json'])
