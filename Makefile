
GIT_HEAD_REF := $(shell git rev-parse HEAD)
BASE_IMAGE := nvidia/cuda:11.2.0-cudnn8-devel-ubuntu20.04

DEV_IMAGE_NAME := text-to-sql-dev
TRAIN_IMAGE_NAME := text-to-sql-train
EVAL_IMAGE_NAME := text-to-sql-eval

BUILDKIT_IMAGE := 1301122/datasaur:buildx-stable-1
BUILDKIT_BUILDER ?= buildx-local
BASE_DIR := $(shell pwd)

.PHONY: init-buildkit
init-buildkit:
	docker buildx create \
		--name buildx-local \
		--driver docker-container \
		--driver-opt image=$(BUILDKIT_IMAGE),network=host \
		--use

.PHONY: del-buildkit
del-buildkit:
	docker buildx rm buildx-local

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

.PHONY: build-dev-image
build-dev-image:
	ssh-add
	docker buildx build \
		--builder $(BUILDKIT_BUILDER) \
		--ssh default=$(SSH_AUTH_SOCK) \
		-f Dockerfile \
		--tag tscholak/$(DEV_IMAGE_NAME):$(GIT_HEAD_REF) \
		--tag tscholak/$(DEV_IMAGE_NAME):cache \
		--tag tscholak/$(DEV_IMAGE_NAME):devcontainer \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--target dev \
		--cache-from type=registry,ref=tscholak/$(DEV_IMAGE_NAME):cache \
		--cache-to type=inline \
		--push \
		git@github.com:ElementAI/picard#$(GIT_HEAD_REF)

.PHONY: pull-dev-image
pull-dev-image:
	docker pull tscholak/$(DEV_IMAGE_NAME):$(GIT_HEAD_REF)

.PHONY: build-train-image
build-train-image:
	ssh-add
	docker buildx build \
		--builder $(BUILDKIT_BUILDER) \
		--ssh default=$(SSH_AUTH_SOCK) \
		-f Dockerfile \
		--tag tscholak/$(TRAIN_IMAGE_NAME):$(GIT_HEAD_REF) \
		--tag tscholak/$(TRAIN_IMAGE_NAME):cache \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--target train \
		--cache-from type=registry,ref=tscholak/$(TRAIN_IMAGE_NAME):cache \
		--cache-to type=inline \
		--push \
		git@github.com:ElementAI/picard#$(GIT_HEAD_REF)

.PHONY: pull-train-image
pull-train-image:
	docker pull tscholak/$(TRAIN_IMAGE_NAME):$(GIT_HEAD_REF)

.PHONY: build-eval-image
build-eval-image:
	ssh-add
	docker buildx build \
		--builder $(BUILDKIT_BUILDER) \
		--ssh default=$(SSH_AUTH_SOCK) \
		-f Dockerfile \
		--tag 1301122/datasaur:$(GIT_HEAD_REF) \
		--tag 1301122/datasaur:cache \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--target eval \
		--cache-from type=registry,ref=1301122/datasaur:cache \
		--cache-to type=inline \
		--push \
		git@github.com:elena-soare/picard#$(GIT_HEAD_REF)

.PHONY: pull-eval-image
pull-eval-image:
	docker pull nvcr.io/nvidia/pytorch:21.10-py3
.PHONY: train
train: pull-train-image
	mkdir -p -m 777 train
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run \
		-it \
		--rm \
		--user 13011:13011 \
		--mount type=bind,source=$(BASE_DIR)/train,target=/train \
		--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache \
		--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
		--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
		tscholak/$(TRAIN_IMAGE_NAME):$(GIT_HEAD_REF) \
		/bin/bash -c "python seq2seq/run_seq2seq.py configs/train.json"

.PHONY: train_cosql
train_cosql: pull-train-image
	mkdir -p -m 777 train
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run \
		-it \
		--rm \
		--user 13011:13011 \
		--mount type=bind,source=$(BASE_DIR)/train,target=/train \
		--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache \
		--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
		--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
		tscholak/$(TRAIN_IMAGE_NAME):$(GIT_HEAD_REF) \
		/bin/bash -c "python seq2seq/run_seq2seq.py configs/train_cosql.json"

.PHONY: eval
eval: pull-eval-image
	mkdir -p -m 777 eval
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run \
		-it \
		--rm \
		--user 13011:13011 \
		--mount type=bind,source=$(BASE_DIR)/eval,target=/eval \
		--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache \
		--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
		--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
		nvidia/cuda \
		/bin/bash -c "python seq2seq/run_seq2seq.py configs/eval.json"

.PHONY: eval_cosql
eval_cosql: pull-eval-image
	mkdir -p -m 777 eval
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run \
		-it \
		--rm \
		--user 13011:13011 \
		--mount type=bind,source=$(BASE_DIR)/eval,target=/eval \
		--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache \
		--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
		--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
		nvcr.io/nvidia/pytorch:21.10-py3 \
		/bin/bash -c "python seq2seq/run_seq2seq.py configs/eval_cosql.json"

.PHONY: serve
serve: pull-eval-image
	mkdir -p -m 777 eval
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run \
		-it \
		--rm \
		--user $(id -u):$(id -g) \
		-p 8000:8000 \
		--mount type=bind,source=$(BASE_DIR)/database,target=/database \
		--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache \
		--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
		nvcr.io/nvidia/pytorch:21.10-py3 \
		/bin/bash -c "python seq2seq/serve_seq2seq.py configs/serve.json"