

import json
from typing import List, Generator, Any, Dict, Tuple
from third_party.spider.preprocess.get_tables import dump_db_json_schema
import datasets


logger = datasets.logging.get_logger(__name__)


_CITATION = """\
"""

_DESCRIPTION = """\
"""

_HOMEPAGE = ""

_LICENSE = ""

_URL = "https://drive.google.com/uc?export=download&id=1ZLv-o1pK8T-fku10f3D-SRVxEhA0Z4Vv"


class Datasaur(datasets.GeneratorBasedBuilder):
    VERSION = datasets.Version("1.0.0")

    BUILDER_CONFIGS = [
        datasets.BuilderConfig(
            name="datasaur",
            version=VERSION,
            description="Datasaur",
        ),
    ]

    def __init__(self, *args, writer_batch_size=None, **kwargs) -> None:
        super().__init__(*args, writer_batch_size=writer_batch_size, **kwargs)
        self.schema_cache = dict()
        self.include_train_others: bool = kwargs.pop("include_train_others", False)

    def _info(self) -> datasets.DatasetInfo:
        features = datasets.Features(
            {
                "query": datasets.Value("string"),
                "question": datasets.Value("string"),
                "db_description": datasets.Value("string"),    
                "db_id": datasets.Value("string"),
                "db_path": datasets.Value("string"),
                "db_table_names": datasets.features.Sequence(datasets.Value("string")),
                "db_column_names": datasets.features.Sequence(
                    {
                        "table_id": datasets.Value("int32"),
                        "column_name": datasets.Value("string"),
                    }
                ),
                "db_column_types": datasets.features.Sequence(datasets.Value("string")),
                "db_primary_keys": datasets.features.Sequence({"column_id": datasets.Value("int32")}),
                "db_foreign_keys": datasets.features.Sequence(
                    {
                        "column_id": datasets.Value("int32"),
                        "other_column_id": datasets.Value("int32"),
                    }
                ),
            }
        )
        return datasets.DatasetInfo(
            description=_DESCRIPTION,
            features=features,
            supervised_keys=None,
            homepage=_HOMEPAGE,
            license=_LICENSE,
            citation=_CITATION,
        )

    def _split_generators(self, dl_manager) -> List[datasets.SplitGenerator]:
        downloaded_filepath = dl_manager.download_and_extract(_URL)


        return [
            datasets.SplitGenerator(
                name=datasets.Split.TRAIN,
                gen_kwargs={
                    "data_filepaths": [
                        downloaded_filepath +"/datasaur/train_datasaur.json",
                    ],
                    
                    "db_path": downloaded_filepath +  "/datasaur/database",
                },
            ),
            datasets.SplitGenerator(
                name=datasets.Split.VALIDATION,
                gen_kwargs={
                    "data_filepaths": [downloaded_filepath + "/datasaur/dev.json"],
                    "db_path": downloaded_filepath + "/datasaur/database",
                },
            ),
        ]


    def _generate_examples(
        self, data_filepaths: List[str], db_path: str
    ) -> Generator[Tuple[int, Dict[str, Any]], None, None]:
        """This function returns the examples in the raw (text) form."""
        for data_filepath in data_filepaths:
            logger.info("generating examples from = %s", data_filepath)
            with open(data_filepath, encoding="utf-8") as f:
                spider = json.load(f)
                for idx, sample in enumerate(spider):
                    db_id = sample["db_id"]
                    if db_id not in self.schema_cache:
                        print(db_path + "/" + db_id + "/" + db_id + ".sqlite")
                        self.schema_cache[db_id] = dump_db_json_schema(
                            db_path + "/" + db_id + "/" + db_id + ".sqlite", db_id
                        )
                    schema = self.schema_cache[db_id]
                    yield idx, {
                        "query": sample["query"],
                        "question": sample["question"],
                        "db_description": sample["db_description"],
                        "db_id": db_id,
                        "db_path": db_path,
                        "db_table_names": schema["table_names_original"],
                        "db_column_names": [
                            {"table_id": table_id, "column_name": column_name}
                            for table_id, column_name in schema["column_names_original"]
                        ],
                        "db_column_types": schema["column_types"],
                        "db_primary_keys": [{"column_id": column_id} for column_id in schema["primary_keys"]],
                        "db_foreign_keys": [
                            {"column_id": column_id, "other_column_id": other_column_id}
                            for column_id, other_column_id in schema["foreign_keys"]
                        ],
                    }