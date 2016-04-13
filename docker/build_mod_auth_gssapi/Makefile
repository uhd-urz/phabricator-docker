PACKAGE:=build_mod_auth_gssapi
ifdef DOCKER_USERNAME
PACKAGE:=$(DOCKER_USERNAME)/$(PACKAGE)
endif

MOD_AUTH_GSSAPI_VERSION:=$(shell env GIT_DIR=../../source/mod_auth_gssapi/.git git describe --tags --dirty)
ifeq ($(MOD_AUTH_GSSAPI_VERSION),)
$(error Unable to determine MOD_AUTH_GSSAPI_VERSION)
endif

$(info Building $(PACKAGE):$(MOD_AUTH_GSSAPI_VERSION) ...)

ifeq ($(UID),)
UID:=$(shell id -u)
endif

ifeq ($(GID),)
GID:=$(shell id -g)
endif

BUILD_IF_IMAGE_UNAVAILABLE:=$(shell docker pull $(PACKAGE):$(MOD_AUTH_GSSAPI_VERSION) > /dev/null 2> /dev/null || echo build)

all: run

run: target $(BUILD_IF_IMAGE_UNAVAILABLE)
	docker run --user $(UID):$(GID) --volume=$(CURDIR)/target:/target $(PACKAGE):$(MOD_AUTH_GSSAPI_VERSION)

Dockerfile: Dockerfile.in
	cp $< $@

build: Dockerfile src/mod_auth_gssapi
	docker build --tag=$(PACKAGE):$(MOD_AUTH_GSSAPI_VERSION) .
	docker push $(PACKAGE):$(MOD_AUTH_GSSAPI_VERSION)

clean:
	$(RM) -r src target

target:
	mkdir target

src:
	mkdir src

# Some hack to make make really run this rule whenever ../../source/mod_auth_gssapi changes
src/%: src/%@$(MOD_AUTH_GSSAPI_VERSION)
	ln -sfn $*@$(MOD_AUTH_GSSAPI_VERSION) $@

src/%@$(MOD_AUTH_GSSAPI_VERSION): ../../source/% src
	rsync -av --delete --exclude=.git $</ $@/

.PHONY: all build clean
.SECONDARY: src/mod_auth_gssapi@$(MOD_AUTH_GSSAPI_VERSION)
