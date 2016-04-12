ifdef DOCKER_USERNAME
PACKAGE:=$(DOCKER_USERNAME)/$(PACKAGE)
endif

TOPDIR:=../..
GIT_DIR:=$(TOPDIR)/.git

BRANCH:=$(TRAVIS_BRANCH)
ifeq ($(BRANCH),)
BRANCH:=$(shell env GIT_DIR=$(GIT_DIR) git branch 2> /dev/null | cut -c3-)
ifeq ($(BRANCH),master)
BRANCH=
endif
endif

TAG:=$(TRAVIS_TAG)
ifeq ($(TAG),)
TAG:=$(shell env GIT_DIR=$(GIT_DIR) git describe --tags 2> /dev/null)
endif

COMMIT:=$(TRAVIS_COMMIT)
ifeq ($(COMMIT),)
COMMIT:=$(shell env GIT_DIR=$(GIT_DIR) git rev-parse HEAD 2> /dev/null)
ifeq ($(COMMIT),HEAD)
COMMIT=
endif
endif

build: .build_succeed

.build_succeed: $(DEPENDENCIES)
	docker build --tag=$(PACKAGE):latest .
ifdef BRANCH
	# git-branch -> docker-tag
	docker tag $(PACKAGE):latest $(PACKAGE):$(BRANCH)
endif
ifdef TAG
	# git-tag -> docker-tag
	docker tag $(PACKAGE):latest $(PACKAGE):$(TAG)
endif
ifdef COMMIT
	# git-commit -> docker-tag
	docker tag $(PACKAGE):latest $(PACKAGE):$(COMMIT)
endif
	touch $@

push: .build_succeed
	docker push $(PACKAGE)

.PHONY: build push
