override VERSION:=$(shell env GIT_DIR=../../source/mod_auth_gssapi/.git git describe --tags)

ifeq ($(VERSION),)
$(error Specify VERSION)
else
$(info Building $(VERSION))
endif

ifeq ($(UID),)
UID:=$(shell id -u)
endif

ifeq ($(GID),)
GID:=$(shell id -g)
endif

all: build

build: src/mod_auth_gssapi target
	docker build --tag=devurandom/build_mod_auth_gssapi:$(VERSION) .
	docker run --user $(UID):$(GID) --volume=$(CURDIR)/target:/target devurandom/build_mod_auth_gssapi:$(VERSION)

clean:
	rm -fr src target

target:
	mkdir target

src:
	mkdir src

# Some hack to make make really run this rule whenever ../../source/mod_auth_gssapi changes
src/%: src/%@$(VERSION)
	ln -sfn $*@$(VERSION) $@

src/%@$(VERSION): ../../source/% src
	rsync -av --delete --exclude=.git $</ $@/

.PHONY: all build clean
.SECONDARY: src/mod_auth_gssapi@$(VERSION)
