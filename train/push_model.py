from huggingface_hub import Repository
import sys

if len(sys.argv) != 2:
    print("Please provide 1 command line argument: the name of the model directory containing pytorch_model.bin.\nFor example: python push_model.py DocuT5-Large-SD")
else:
    repo = Repository(local_dir=sys.argv[1])
    repo.push_to_hub(commit_message="Commit model to the Hub")
