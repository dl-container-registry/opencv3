SHELL := bash
BASE_NAME := opencv3
CONTAINER_NAME := willprice/$(BASE_NAME)
SINGULARITY_NAME := $(BASE_NAME).simg
TAG := cuda-10.1-cudnn7

.PHONY: all
all: build singularity

.PHONY: build
build:
	docker build -t $(CONTAINER_NAME):$(TAG) .

.PHONY: push
push:
	docker push $(CONTAINER_NAME):$(TAG)

.PHONY: singularity
singularity: $(SINGULARITY_NAME)

$(SINGULARITY_NAME):
	singularity build $@ Singularity
