GIT_REF ?= $(shell git rev-parse --verify --short HEAD)
BASEDIR = $(shell git rev-parse --show-toplevel)
PROJECT_NAME ?= $(shell basename `pwd` | tr [:upper:] [:lower:] )
USE_TTY ?= $(shell if [ -t 0 ]; then echo "-it"; fi)
IMAGE_NAME ?= project_$(PROJECT_NAME)_$(GIT_REF)-$(USER)-dev

DOCKER_RUN = docker run --rm -i $(USE_TTY) \
	-v $(PWD):/project \
	-v $(PWD)/.renv_cache:/renv_cache \
	-w /project \
	$(IMAGE_NAME)

.PHONY: build build-prod shell

build:
	docker build $(ARGS) -t $(IMAGE_NAME) --target dev .

build-prod:
	docker build $(ARGS) -t $(IMAGE_NAME) --target prod .

test:
	$(DOCKER_RUN) R -e 'source("deps.R")'

shell: build
	$(DOCKER_RUN) bash

R: build
	$(DOCKER_RUN) R
