from typing import Optional, List, Dict, Callable
from dataclasses import dataclass, field
from datasets.dataset_dict import DatasetDict
from datasets.arrow_dataset import Dataset
from transformers.training_args import TrainingArguments
from seq2seq.utils.bridge_content_encoder import get_database_matches
import re
import random


@dataclass
class DataTrainingArguments:
    """
    Arguments pertaining to what data we are going to input our model for training and eval.
    """

    tables_file: Optional[str] = field(
        default="tables.json",
        metadata={
            "help": "Tables.json name"},
    )
    gold_file: Optional[str] = field(
        default="gold.json",
        metadata={
            "help": "gold.json name"},
    )
    overwrite_cache: bool = field(
        default=False,
        metadata={"help": "Overwrite the cached training and evaluation sets"},
    )
    preprocessing_num_workers: Optional[int] = field(
        default=None,
        metadata={"help": "The number of processes to use for the preprocessing."},
    )
    max_source_length: Optional[int] = field(
        default=512,
        metadata={
            "help": "The maximum total input sequence length after tokenization. Sequences longer "
            "than this will be truncated, sequences shorter will be padded."
        },
    )
    max_target_length: Optional[int] = field(
        default=512,
        metadata={
            "help": "The maximum total sequence length for target text after tokenization. Sequences longer "
            "than this will be truncated, sequences shorter will be padded."
        },
    )
    val_max_target_length: Optional[int] = field(
        default=None,
        metadata={
            "help": "The maximum total sequence length for validation target text after tokenization. Sequences longer "
            "than this will be truncated, sequences shorter will be padded. Will default to `max_target_length`."
            "This argument is also used to override the ``max_length`` param of ``model.generate``, which is used "
            "during ``evaluate`` and ``predict``."
        },
    )
    val_max_time: Optional[int] = field(
        default=None,
        metadata={
            "help": "The maximum allowed time in seconds for generation of one example. This setting can be used to stop "
            "generation whenever the full generation exceeds the specified amount of time."
        },
    )
    max_train_samples: Optional[int] = field(
        default=None,
        metadata={
            "help": "For debugging purposes or quicker training, truncate the number of training examples to this "
            "value if set."
        },
    )
    max_val_samples: Optional[int] = field(
        default=None,
        metadata={
            "help": "For debugging purposes or quicker training, truncate the number of validation or test examples to this "
            "value if set."
        },
    )
    num_beams: int = field(
        default=1,
        metadata={
            "help": "Number of beams to use for evaluation. This argument will be passed to ``model.generate``, "
            "which is used during ``evaluate`` and ``predict``."
        },
    )
    num_beam_groups: int = field(
        default=1,
        metadata={
            "help": "Number of beam groups to use for evaluation. This argument will be passed to ``model.generate``, "
            "which is used during ``evaluate`` and ``predict``."
        },
    )
    diversity_penalty: Optional[float] = field(
        default=None,
        metadata={
            "help": "Diversity penalty to use for evaluation. This argument will be passed to ``model.generate``, "
            "which is used during ``evaluate`` and ``predict``."
        },
    )
    num_return_sequences: Optional[int] = field(
        default=None,
        metadata={
            "help": "The number of sequences to generate during evaluation. This argument will be passed to "
            "``model.generate``, which is used during ``evaluate`` and ``predict``."
        },
    )
    ignore_pad_token_for_loss: bool = field(
        default=True,
        metadata={
            "help": "Whether or not to ignore the tokens corresponding to padded labels in the loss computation or not."
        },
    )
    source_prefix: Optional[str] = field(
        default=None,
        metadata={
            "help": "A prefix to add before every source text (useful for T5 models)."},
    )
    schema_serialization_type: str = field(
        default="peteshaw",
        metadata={
            "help": "Choose between ``verbose`` and ``peteshaw`` schema serialization."},
    )
    schema_serialization_randomized: bool = field(
        default=False,
        metadata={"help": "Whether or not to randomize the order of tables."},
    )
    schema_serialization_with_db_id: bool = field(
        default=True,
        metadata={
            "help": "Whether or not to add the database id to the context. Needed for Picard."},
    )
    schema_serialization_with_db_content: bool = field(
        default=True,
        metadata={
            "help": "Whether or not to use the database content to resolve field matches."},
    )
    schema_serialization_with_foreign_keys: str = field(
        default=False,
        metadata={"help": "Whether or not to include foreign keys in the schema"},
    )

    schema_serialization_with_db_description: str = field(
        default=False,
        metadata={"help": "Whether or not to include foreign keys in the schema"},
    )
    normalize_query: bool = field(default=True, metadata={
                                  "help": "Whether to normalize the SQL queries."})
    target_with_db_id: bool = field(
        default=True,
        metadata={
            "help": "Whether or not to add the database id to the target. Needed for Picard."},
    )

    def __post_init__(self):
        if self.val_max_target_length is None:
            self.val_max_target_length = self.max_target_length


@dataclass
class DataArguments:
    dataset: str = field(
        metadata={"help": "The dataset to be used. Choose between ``spider``, ``cosql``, or ``cosql+spider``, or ``spider_realistic``, or ``spider_syn``, or ``spider_dk``."},
    )
    dataset_paths: Dict[str, str] = field(
        default_factory=lambda: {
            "spider": "./seq2seq/datasets/spider",
            "spider_dk": "./seq2seq/datasets/spider_dk",
            "spider_syn": "./seq2seq/datasets/spider_syn",
            "cosql": "./seq2seq/datasets/cosql",
            "seoss": "./seq2seq/datasets/seoss",
            "spider_realistic": "./seq2seq/datasets/spider_realistic",
            "spider_syn": "./seq2seq/datasets/spider_syn",
            "spider_dk": "./seq2seq/datasets/spider_dk"

        },
        metadata={"help": "Paths of the dataset modules."},
    )
    metric_config: str = field(
        default="both",
        metadata={
            "help": "Choose between ``exact_match``, ``test_suite``, or ``both``."},
    )
    # we are referencing spider_realistic to spider metrics only as both use the main spider dataset as base.
    metric_paths: Dict[str, str] = field(
        default_factory=lambda: {
            "spider": "./seq2seq/metrics/spider",
            "spider_dk": "./seq2seq/metrics/spider",
            "spider_syn": "./seq2seq/metrics/spider",
            "cosql": "./seq2seq/metrics/cosql",
            "seoss": "./seq2seq/metrics/seoss",
            "spider_realistic": "./seq2seq/metrics/spider",
        },
        metadata={"help": "Paths of the metric modules."},
    )
    test_suite_db_dir: Optional[str] = field(
        default=None,
        metadata={"help": "Path to the test-suite databases."})
    data_config_file: Optional[str] = field(
        default=None,
        metadata={
            "help": "Path to data configuration file (specifying the database splits)"}
    )
    test_sections: Optional[List[str]] = field(
        default=None,
        metadata={"help": "Sections from the data config to use for testing"}
    )


@dataclass
class TrainSplit(object):
    dataset: Dataset
    schemas: Dict[str, dict]


@dataclass
class EvalSplit(object):
    dataset: Dataset
    examples: Dataset
    schemas: Dict[str, dict]


@dataclass
class DatasetSplits(object):
    train_split: Optional[TrainSplit]
    eval_split: Optional[EvalSplit]
    test_splits: Optional[Dict[str, EvalSplit]]
    schemas: Dict[str, dict]


def _get_schemas(examples: Dataset) -> Dict[str, dict]:
    schemas: Dict[str, dict] = {}
    for ex in examples:
        if ex["db_id"] not in schemas:
            schemas[ex["db_id"]] = {
                "db_table_names": ex["db_table_names"],
                "db_column_names": ex["db_column_names"],
                "db_column_types": ex["db_column_types"],
                "db_primary_keys": ex["db_primary_keys"],
                "db_foreign_keys": ex["db_foreign_keys"],
            }
    return schemas


def _prepare_train_split(
    dataset: Dataset,
    data_training_args: DataTrainingArguments,
    add_serialized_schema: Callable[[dict], dict],
    pre_process_function: Callable[[dict, Optional[int], Optional[int]], dict],
) -> TrainSplit:
    schemas = _get_schemas(examples=dataset)
    dataset = dataset.map(
        add_serialized_schema,
        batched=False,
        num_proc=data_training_args.preprocessing_num_workers,
        load_from_cache_file=not data_training_args.overwrite_cache,
    )
    if data_training_args.max_train_samples is not None:
        dataset = dataset.select(range(data_training_args.max_train_samples))
    column_names = dataset.column_names
    dataset = dataset.map(
        lambda batch: pre_process_function(
            batch=batch,
            max_source_length=data_training_args.max_source_length,
            max_target_length=data_training_args.max_target_length,
        ),
        batched=True,
        num_proc=data_training_args.preprocessing_num_workers,
        remove_columns=column_names,
        load_from_cache_file=not data_training_args.overwrite_cache,
    )
    return TrainSplit(dataset=dataset, schemas=schemas)


def _prepare_eval_split(
    dataset: Dataset,
    data_training_args: DataTrainingArguments,
    add_serialized_schema: Callable[[dict], dict],
    pre_process_function: Callable[[dict, Optional[int], Optional[int]], dict],
) -> EvalSplit:
    if (data_training_args.max_val_samples is not None
            and data_training_args.max_val_samples < len(dataset)):
        eval_examples = dataset.select(
            range(data_training_args.max_val_samples))
    else:
        eval_examples = dataset
    schemas = _get_schemas(examples=eval_examples)
    eval_dataset = eval_examples.map(
        add_serialized_schema,
        batched=False,
        num_proc=data_training_args.preprocessing_num_workers,
        load_from_cache_file=not data_training_args.overwrite_cache,
    )
    column_names = eval_dataset.column_names
    eval_dataset = eval_dataset.map(
        lambda batch: pre_process_function(
            batch=batch,
            max_source_length=data_training_args.max_source_length,
            max_target_length=data_training_args.val_max_target_length,
        ),
        batched=True,
        num_proc=data_training_args.preprocessing_num_workers,
        remove_columns=column_names,
        load_from_cache_file=not data_training_args.overwrite_cache,
    )
    return EvalSplit(dataset=eval_dataset, examples=eval_examples, schemas=schemas)


def prepare_splits(
    dataset_dict: DatasetDict,
    data_args: DataArguments,
    training_args: TrainingArguments,
    data_training_args: DataTrainingArguments,
    add_serialized_schema: Callable[[dict], dict],
    pre_process_function: Callable[[dict, Optional[int], Optional[int]], dict],
) -> DatasetSplits:
    train_split, eval_split, test_splits = None, None, None

    if training_args.do_train:
        train_split = _prepare_train_split(
            dataset_dict["train"],
            data_training_args=data_training_args,
            add_serialized_schema=add_serialized_schema,
            pre_process_function=pre_process_function,
        )

    if training_args.do_eval:
        eval_split = _prepare_eval_split(
            dataset_dict["validation"],
            data_training_args=data_training_args,
            add_serialized_schema=add_serialized_schema,
            pre_process_function=pre_process_function,
        )

    if training_args.do_predict:
        test_splits = {
            section: _prepare_eval_split(
                dataset_dict[section],
                data_training_args=data_training_args,
                add_serialized_schema=add_serialized_schema,
                pre_process_function=pre_process_function,
            )
            for section in data_args.test_sections
        }
        test_split_schemas = {}
        for split in test_splits.values():
            test_split_schemas.update(split.schemas)

    schemas = {
        **(train_split.schemas if train_split is not None else {}),
        **(eval_split.schemas if eval_split is not None else {}),
        **(test_split_schemas if test_splits is not None else {}),
    }

    return DatasetSplits(
        train_split=train_split,
        eval_split=eval_split,
        test_splits=test_splits,
        schemas=schemas
    )


def normalize(query: str) -> str:
    def comma_fix(s):
        # Remove spaces in front of commas
        return s.replace(" , ", ", ")

    def white_space_fix(s):
        # Remove double and triple spaces
        return " ".join(s.split())

    def lower(s):
        # Convert everything except text between (single or double) quotation marks to lower case
        return re.sub(r"\b(?<!['\"])(\w+)(?!['\"])\b", lambda match: match.group(1).lower(), s)

    return comma_fix(white_space_fix(lower(query)))


def serialize_schema(
    question: str,
    db_path: str,
    db_id: str,
    db_column_names: Dict[str, str],
    db_table_names: List[str],
    db_foreign_keys: Dict[str, List[str]],
    db_primary_keys: Dict[str, List[str]],
    description: str,
    schema_serialization_type: str = "peteshaw",
    schema_serialization_randomized: bool = False,
    schema_serialization_with_db_id: bool = True,
    schema_serialization_with_db_content: bool = False,
    schema_serialization_with_foreign_keys: bool = False,
    schema_serialization_with_db_description: bool = True,
    normalize_query: bool = True,
) -> str:
    pair1 = db_foreign_keys['column_id']
    pair2 = db_foreign_keys['other_column_id']
    foreign = {}
# {'table_id': [-1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3], 'column_name': ['*', 'Stadium_ID', 'Location', 'Name', 'Capacity', 'Highest', 'Lowest', 'Average', 'Singer_ID', 'Name', 'Country', 'Song_Name', 'Song_release_year', 'Age', 'Is_male', 'concert_ID', 'concert_Name', 'Theme', 'Stadium_ID', 'Year', 'concert_ID', 'Singer_ID']}

    desc_sep = " | description | "
    if schema_serialization_type == "verbose":
        db_id_str = "Database: {db_id}. "
        table_sep = ". "
        table_str = "Table: {table}. Columns: {columns}"
        column_sep = ", "
        column_str_with_values = "{column} ({values})"
        column_str_without_values = "{column}"
        value_sep = ", "
    elif schema_serialization_type == "peteshaw":
        # see https://github.com/google-research/language/blob/master/language/nqg/tasks/spider/append_schema.py#L42
        db_id_str = " | {db_id}"
        table_sep = ""
        table_str = " | {table} : {columns}"
        column_sep = " , "
        column_str_with_values = "{column} ( {values} )"
        column_str_without_values = "{column}"
        column_sep_key = " - "
        value_sep = " , "
    else:
        raise NotImplementedError

    def get_column_str(i: int, table_name: str, column_name: str) -> str:
        column_name_str = column_name.lower() if normalize_query else column_name
        column_str = ''
        if schema_serialization_with_db_content:
            matches = get_database_matches(
                question=question,
                table_name=table_name,
                column_name=column_name,
                db_path=f"{db_path}/{db_id}/{db_id}.sqlite",
            )
            if matches:
                column_str = column_str_with_values.format(
                    column=column_name_str, values=value_sep.join(matches))
            else:
                column_str = column_str_without_values.format(
                    column=column_name_str)
        else:
            column_str = column_str_without_values.format(
                column=column_name_str)

        no_or_both_primary_key = (i in pair1 and pair2[pair1.index(i)] not in db_primary_keys['column_id'] or i in pair2 and pair1[pair2.index(i)] not in db_primary_keys['column_id']) and i not in db_primary_keys['column_id'] or (
            i in pair1 and pair2[pair1.index(i)] in db_primary_keys['column_id'] or i in pair2 and pair1[pair2.index(i)] in db_primary_keys['column_id']) and i in db_primary_keys['column_id']

        column_ref_id = -1
        if i in pair1 and (pair2[pair1.index(i)] in db_primary_keys['column_id'] or no_or_both_primary_key):
            column_ref_id = pair2[pair1.index(i)]
        elif i in pair2 and (pair1[pair2.index(i)] in db_primary_keys['column_id'] or no_or_both_primary_key):
            column_ref_id = pair1[pair2.index(i)]

        if column_ref_id != -1:

            # primary_key_column = db_column_names['column_name'][column_ref_id]
            # primary_key_column = primary_key_column.lower() if normalize_query else primary_key_column

            primary_key_table = db_table_names[int(
                db_column_names['table_id'][column_ref_id])]
            primary_key_table = primary_key_table.lower(
            ) if normalize_query else primary_key_table

            column_str = f'{column_str} foreign key {primary_key_table} '  # + '.' + primary_key_column +''

        return column_str

    tables = [
        table_str.format(
            table=table_name.lower() if normalize_query else table_name,
            columns=column_sep.join(
                map(
                    lambda y: get_column_str(
                        i=y[0], table_name=table_name, column_name=y[1][1]),
                    filter(
                        lambda y: y[1][0] == table_id,
                        enumerate(zip(
                            db_column_names["table_id"],
                            db_column_names["column_name"],
                        )),
                    ),
                )
            ),
        )
        for table_id, table_name in enumerate(db_table_names)
    ]
    if schema_serialization_randomized:
        random.shuffle(tables)
    if schema_serialization_with_db_id:
        serialized_schema = db_id_str.format(
            db_id=db_id) + table_sep.join(tables)
    else:
        serialized_schema = table_sep.join(tables)
    if schema_serialization_with_db_description:
        serialized_schema += desc_sep + description
    print(f'serializes: {serialized_schema}')
    return serialized_schema
