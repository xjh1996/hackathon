
# Container registries.
REGISTRY ?= cr-cn-beijing.volces.com/gameover

# Module name.
NAME := web-server
# Container image prefix and suffix added to targets.
# The final built images are:
#   $[REGISTRY]/$[IMAGE_PREFIX]$[TARGET]$[IMAGE_SUFFIX]:$[VERSION]
# $[REGISTRY] is an item from $[REGISTRIES], $[TARGET] is an item from $[TARGETS].
IMAGE_PREFIX ?= $(strip )
IMAGE_SUFFIX ?= $(strip )

IMAGE_NAME := $(IMAGE_PREFIX)$(NAME)$(IMAGE_SUFFIX)

VERSION      ?= $(shell git describe --tags --always --dirty)

# Track code version with Docker Label.
DOCKER_LABELS ?= git-describe="$(shell date -u +v%Y%m%d)-$(shell git describe --tags --always --dirty)"

# Build directory.
BUILD_DIR := ./build

container:
	@docker build -t $(REGISTRY)/$(IMAGE_NAME):$(VERSION)                  \
	  --label $(DOCKER_LABELS)                                             \
	  -f $(BUILD_DIR)/Dockerfile .;

push: container
	@docker push $(REGISTRY)/$(IMAGE_NAME):$(VERSION);