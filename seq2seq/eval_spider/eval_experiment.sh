#!/bin/bash
if [ "$1" == "" ] || [ $# -gt 1 ]; then
	echo "Pass an experiment name as a command-line argument, e.g. ./eval_experiment.sh rasat-spider-dev-20-10-2022"
	exit 1
fi

python format_predictions.py ../../experiment/$1/predictions_eval_None.json

python evaluation.py --gold ../../dataset_files/ori_dataset/spider/dev_gold.sql --pred ../../experiment/$1/predictions.sql --etype all --db ../../dataset_files/ori_dataset/spider/database --table ../../dataset_files/ori_dataset/spider/tables.json > ../../experiment/$1/eval_breakdown.txt

cat ../../experiment/$1/eval_breakdown.txt
