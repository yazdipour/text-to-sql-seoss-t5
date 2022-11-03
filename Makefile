GIT_HEAD_REF := $(shell git rev-parse HEAD)
BASE_IMAGE := pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel
IMAGE_NAME := 1301122/datasaur
BUILDKIT_BUILDER ?= buildx-local
BASE_DIR := $(shell pwd)
PICARD_IMAGE := tscholak/text-to-sql-eval:6a252386bed6d4233f0f13f4562d8ae8608e7445


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
		docker pull $(PICARD_IMAGE)

.PHONY: build-eval-image
build-eval-image:
		docker build . --tag $(IMAGE_NAME):$(GIT_HEAD_REF) --build-arg BASE_IMAGE=pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel


.PHONY: train
train:
		mkdir -p -m 777 train
		mkdir -p -m 777 transformers_cache
		mkdir -p -m 777 wandb
		# --runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=compute,utility -e NVIDIA_VISIBLE_DEVICES=all
		docker run \
    			-it --rm --user root -p 8000:8000 \
			--mount type=bind,source=$(BASE_DIR)/train,target=/train \
			--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
			--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache  \
			--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
			$(PICARD_IMAGE) \
	       		# /bin/bash -c "python seq2seq/run_seq2seq.py configs/train.json"
			# 1301122/datasaur:$(GIT_HEAD_REF)



.PHONY: eval
eval:
		mkdir -p -m 777 eval
		mkdir -p -m 777 transformers_cache
		mkdir -p -m 777 wandb
		docker run \
			-it --user root -p 8000:8000 \
			--mount type=bind,source=$(BASE_DIR)/experiment,target=/app/experiment \
			--mount type=bind,source=$(BASE_DIR)/wandb,target=/app/wandb \
			--mount type=bind,source=$(BASE_DIR)/transformers_cache,target=/transformers_cache  \
			--mount type=bind,source=$(BASE_DIR)/configs,target=/app/configs \
			$(IMAGE_NAME):$(GIT_HEAD_REF) \
			# /bin/bash -c "python seq2seq/run_seq2seq.py configs/eval.json"




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

