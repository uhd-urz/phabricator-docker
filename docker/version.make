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
