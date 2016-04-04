SUBDIRS:=phabricator-mysql

all: build

SUBDIRS_BUILD:=$(patsubst %,%@build,$(SUBDIRS))

build: $(SUBDIRS_BUILD)

$(SUBDIRS_BUILD):
	$(MAKE) -C $(subst @build,,$@) build

SUBDIRS_PUSH:=$(patsubst %,%@push,$(SUBDIRS))

push: $(SUBDIRS_PUSH)

$(SUBDIRS_PUSH):
	$(MAKE) -C $(subst @push,,$@) push

.PHONY: $(SUBDIRS) $(SUBDIRS_BUILD) $(SUBDIRS_PUSH)
