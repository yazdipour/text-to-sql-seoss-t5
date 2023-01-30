GIT_HEAD_REF := $(shell git rev-parse HEAD)
BASE_IMAGE := pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel
IMAGE_NAME := totem37/docu-t5
IMAGE_TAG := 03112022
BUILDKIT_BUILDER ?= buildx-local
BASE_DIR := $(shell pwd)


.PHONY: build-thrift-code
build-thrift-code:
		thrift1 --gen mstch_cpp2 picard.thrift
		thrift1 --gen mstch_py3 picard.thrift
		cd gen-py3 && python setup.py build_ext --inplace

.PHONY: build-picard-deps
build-picard-deps:
		cabal update
		thrift-compiler --hs --use-hash-map --use-hash-set --gen-prefix gen-hs -o . picard.thrift
		patch -p 1 -N -d third_party/hsthrift < ./fb-util-cabal.patch || true
		cd third_party/hsthrift \
			&& make THRIFT_COMPILE=thrift-compiler thrift-cpp thrift-hs
		cabal build --only-dependencies lib:picard

.PHONY: build-picard
build-picard:
		cabal install --overwrite-policy=always --install-method=copy exe:picard

.PHONY: pull-eval-image
pull-eval-image:
		docker pull $(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build-eval-image
build-eval-image:
		docker build . --tag $(IMAGE_NAME):$(GIT_HEAD_REF) --build-arg BASE_IMAGE=pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel


.PHONY: train
train:
		mkdir -p -m 777 train
		mkdir -p -m 777 transformers_cache
		mkdir -p -m 777 wandb
		docker run \
    			-it --gpus all --user root -p 8000:8000 --ipc=host \
				 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility -e NVIDIA_VISIBLE_DEVICES=all \
			--mount type=bind,source=$(BASE_DIR)/train,target=/app/train \
			--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
			--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache  \
			--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
			--mount type=bind,source=$(BASE_DIR)/seq2seq,target=/app/seq2seq \
			--mount type=bind,source=$(BASE_DIR)/eval,target=/eval \
			--mount type=bind,source=$(BASE_DIR)/dataset_files,target=/app/dataset_files \
			$(IMAGE_NAME):$(IMAGE_TAG) \
			# --runtime=nvidia 
	       		# /bin/bash -c "python seq2seq/run_seq2seq.py configs/train.json"



.PHONY: eval
eval:
		mkdir -p -m 777 eval
		mkdir -p -m 777 transformers_cache
		mkdir -p -m 777 wandb
		docker run \
			--gpus all \
			-it --user root -p 8000:8000 \
			--mount type=bind,source=$(BASE_DIR)/experiment,target=/app/experiment \
			--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
			--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache  \
			--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
			--mount type=bind,source=$(BASE_DIR)/seq2seq,target=/app/seq2seq \
			--mount type=bind,source=$(BASE_DIR)/eval,target=/eval \
			--mount type=bind,source=$(BASE_DIR)/dataset_files,target=/app/dataset_files \
			--mount type=bind,source=$(BASE_DIR)/.vscode,target=/app/.vscode \
			$(IMAGE_NAME):$(IMAGE_TAG) \
			# /bin/bash -c "CUDA_VISIBLE_DEVICES="0" python seq2seq/run_seq2seq.py configs/eval.json"




.PHONY: serve
serve:
		mkdir -p -m 777 transformers_cache
		mkdir -p -m 777 wandb
		docker run -ti --runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=compute,utility -e NVIDIA_VISIBLE_DEVICES=all \
			-it --rm --user root -p 8000:8000 \
			--mount type=bind,source=$(BASE_DIR)/database,target=/database \
			--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache  \
			--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
			1301122/datasaur:$(GIT_HEAD_REF) /bin/bash -c "python seq2seq/serve_seq2seq.py configs/serve.json"

