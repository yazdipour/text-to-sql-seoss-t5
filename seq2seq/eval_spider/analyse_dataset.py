from evaluation import eval_hardness, AGG_OPS

import json
import os
import sys


def form_clause_str(sql_dict, delimiter='|'):
    """
    Given a dictionary of SQL clauses, form a string encoding them
    """
    ##############################
    # 
    # select: is distinct, aggregation
    # from: has join
    # where: has and/or, aggregation, has nested subquery
    # groupBy
    # orderBy: is asc/desc
    # having: has and/or, has join, aggregation, has nested subquery
    # limit
    # intersect
    # except
    # union
    # 
    ##############################
    clause_str = ""

    # select clause
    clause_str += "SELECT "
    select = sql_dict.get('select')
    if select[0]:
        clause_str += "DISTINCT "
    for unit in select[1]:
        if unit[0] != 0:
            clause_str += AGG_OPS[unit[0]] + " "
    clause_str += delimiter

    # from clause
    clause_str += "FROM "
    from = sql_dict.get('from')
    if len(from.get('table_units')) > 1:
        clause_str += "JOIN "
    clause_str += delimiter

    # where clause
    clause_str += "WHERE "
    where = sql_dict.get('where')
    if 'and' in where:
        clause_str += "AND "
    if 'or' in where:
        clause_str += "OR "
    for unit in where:
        if unit[2][1][0] != 0:
            clause_str += AGG_OPS[unit[2][1][0]] + " "
        if unit[2][2][0] != 0:
            clause_str += AGG_OPS[unit[2][2][0]] + " "
    for unit in where:
        if type(unit[3]) == dict or type(unit[4]) == dict:
            clause_str += "SUBQUERY "
            break
    clause_str += delimiter

    return clause_str


def analyse_dataset(dataset_name):
    """
    Prints statistics on the gold queries for a given dataset
    """
    delimiter = '|'
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
            instance_str += f" {delimiter} "
            instance_str += eval_hardness(i['query'])
            instance_str += " {delimiter} "
            instance_str += form_clause_str(i['sql'], delimiter)

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
