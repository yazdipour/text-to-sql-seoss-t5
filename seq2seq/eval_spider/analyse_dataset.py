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
    # having: has and/or, aggregation, has nested subquery
    # orderBy: is asc/desc
    # limit
    # union
    # intersect
    # except
    # 
    ##############################
    clause_str = ""

    # select clause
    select = sql_dict.get('select')
    clause_str += "SELECT "
    if select[0]:
        clause_str += "DISTINCT "
    for unit in select[1]:
        if unit[0] != 0:
            clause_str += AGG_OPS[unit[0]] + " "
    clause_str += delimiter

    # from clause
    from = sql_dict.get('from')
    clause_str += "FROM "
    if len(from.get('table_units')) > 1:
        clause_str += "JOIN "
    clause_str += delimiter

    # where clause
    where = sql_dict.get('where')
    if where:
        clause_str += "WHERE "
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
    
    # group by clause
    group_by = sql_dict.get('groupBy')
    if group_by:
        clause_str += "GROUP BY "
    clause_str += delimiter
    
    # having clause
    having = sql_dict.get('having')
    if having:
        if 'and' in having:
            clause_str += "AND "
        if 'or' in having:
            clause_str += "OR "
        for unit in having:
            if unit[2][1][0] != 0:
                clause_str += AGG_OPS[unit[2][1][0]] + " "
            if unit[2][2][0] != 0:
                clause_str += AGG_OPS[unit[2][2][0]] + " "
        for unit in having:
            if type(unit[3]) == dict or type(unit[4]) == dict:
                clause_str += "SUBQUERY "
                break
    clause_str += delimiter
    
    # order by clause
    order_by = sql_dict.get('orderBy')
    if order_by:
        clause_str += "ORDER BY " + order_by[0] + " "
    clause_str += delimiter
    
    # limit clause
    limit = sql_dict.get('limit')
    if limit:
        clause_str += "LIMIT " + str(limit) + " "
    clause_str += delimiter
    
    # union clause
    union = sql_dict.get('union')
    if union:
        clause_str += "UNION "
    clause_str += delimiter
    
    # intersect clause
    intersect = sql_dict.get('intersect')
    if intersect:
        clause_str += "INTERSECT "
    clause_str += delimiter
    
    # except clause
    if sql_dict.get('except'):
        clause_str += "EXCEPT "

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
