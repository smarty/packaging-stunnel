#!/usr/bin/make -f

NAME  := stunnel
REPO  ?= $(or ${DOCKER_SERVER},smartystreets)
IMAGE := $(REPO)/$(NAME):$(or ${VERSION},current)

image: OS  ?= linux
image: CPU ?= amd64
image:
	docker build . --no-cache --rm -t "$(IMAGE)"

publish: image
	docker push "$(IMAGE)"

.PHONY: image publish
