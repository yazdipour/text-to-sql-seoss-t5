from evaluation import *

import json
import os
import sys


def form_clause_str(sql_dict, delimiter='|'):
    """
    Given a dictionary of SQL clauses, form a string encoding them
    """


def analyse_dataset(dataset_name):
    """
    Prints statistics on the gold queries for a given dataset
    """
    query_data = []

    dataset_file = f"../../dataset_files/ori_dataset/{dataset_name}/"
    if dataset_name == "spider_dk":
        dataset_file += "spider-DK.json"
    else:
        dataset_file += "dev.json"

    with open(dataset_file, 'r') as input_file:
        instances = json.loads(input_file.read())
        for i in instances:
            instance_str = ""

            # Append statistics to a string
            instance_str += i['query']
            instance_str += " | "
            instance_str += eval_hardness(i['query'])
            instance_str += " | "
            instance_str += form_clause_str(i['sql'])

            query_data.append(instance_str)

    out_filename = "../../dataset_files/statistics/{dataset_name}.txt"

    with open(out_filename, 'w') as output_file:
        for q in query_data:
            output_file.write(q + '\n')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("analyse_dataset() takes 1 argument: the dataset name, e.g. spider_dk")
    else:
        dataset_name = sys.argv[1]
        analyse_dataset(dataset_name)
