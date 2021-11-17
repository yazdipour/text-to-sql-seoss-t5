
GIT_HEAD_REF := $(shell git rev-parse HEAD)
BASE_IMAGE := nvidia/cuda:11.2.0-cudnn8-devel-ubuntu20.04


IMAGE_NAME := 1301122/datasaur

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

.PHONY: build-eval-image
build-eval-image:
	ssh-add
	docker build . --tag $(IMAGE_NAME):cache \
	--build-arg BASE_IMAGE=pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel \ 
	--push \
	git@github.com:elena-soare/picard#$(GIT_HEAD_REF)



# .PHONY: build-eval-image
# build-eval-image:
# 	ssh-add
# 	docker buildx build \
# 		--builder $(BUILDKIT_BUILDER) \
# 		--ssh default=$(SSH_AUTH_SOCK) \
# 		-f Dockerfile \
# 		--tag 1301122/datasaur:$(GIT_HEAD_REF) \
# 		--tag 1301122/datasaur:cache --build-arg BASE_IMAGE=$(BASE_IMAGE) \
# 		--target eval \
# 		--cache-from type=registry,ref=1301122/datasaur:cache \
# 		--cache-to type=inline \
# 		--push \
# 		git@github.com:elena-soare/picard#$(GIT_HEAD_REF)


.PHONY: eval
eval: pull-eval-image
	mkdir -p -m 777 eval
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run -ti --runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=compute,utility -e NVIDIA_VISIBLE_DEVICES=all \
		-it --rm --user 1000:1001 -p 8000:8000 \
		--mount type=bind,source=/home/eliutza98/picard/eval,target=/eval \
		--mount type=bind,source=/home/eliutza98/picard/transformers_cache,target=/transformers_cache  \
		--mount type=bind,source=/home/eliutza98/picard/configs,target=/app/configs \
		1301122/datasaur:cache
		/bin/bash -c "python seq2seq/run_seq2seq.py configs/eval.json"




.PHONY: serve
serve: pull-eval-image
	mkdir -p -m 777 eval
	mkdir -p -m 777 transformers_cache
	mkdir -p -m 777 wandb
	docker run -ti --runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=compute,utility -e NVIDIA_VISIBLE_DEVICES=all \
		-it --rm --user 1000:1001 -p 8000:8000 \
		--mount type=bind,source=/home/eliutza98/picard/database,target=/database \
		--mount type=bind,source=/home/eliutza98/picard/transformers_cache,target=/transformers_cache  \
		--mount type=bind,source=/home/eliutza98/picard/configs,target=/configs \
		1301122/datasaur:cache
		/bin/bash -c "python seq2seq/run_seq2seq.py configs/eval.json"


