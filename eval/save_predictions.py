import csv
import json
import os
import sys

def save_predictions(experiment_path):
    """
    Save the predictions in results_sql.csv to the given experiment directory
    """
    predictions = []

    with open('results_sql.csv', 'r') as file:
        reader = csv.reader(file, quoting=csv.QUOTE_ALL)
        for line in reader:
            predictions.append(line[1])

    out_filename = os.path.join(experiment_path, 'predictions_eval_None.json')

    with open(out_filename, 'r') as file:
        predictions_content = json.loads(file.read())

    for pred,instance in zip(predictions, predictions_content):
        instance['prediction'] = pred

    with open(out_filename, 'w') as file:
        json.dump(predictions_content, file, indent=4)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("save_predictions() takes 1 argument: the path to the experiment directory")
    else:
        experiment_path = sys.argv[1]
        save_predictions(experiment_path)

