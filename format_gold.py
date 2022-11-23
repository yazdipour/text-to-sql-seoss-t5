import json
import os

def format_gold(json_filename):
    """
    Formats gold SQL queries from a .json file to a .sql file so they can be evaluated
    """
    gold_queries = []

    with open(json_filename, 'r') as input_file:
        all_instances = json.loads(input_file.read())
        for p in all_instances:
            gold_queries.append(f"{p['query']}\t{p['db_id']}")

    out_filename = os.path.join(os.path.dirname(json_filename), "dev_gold.sql")

    with open(out_filename, 'w') as output_file:
        for q in gold_queries:
            output_file.write(q + '\n')

if __name__ == "__main__":
    format_gold("dataset_files/ori_dataset/spider_dk/spider-DK.json")

