SUBDIRS:=docker

all: build

SUBDIRS_BUILD:=$(subst %,%@build,$(SUBDIRS))

build: $(SUBDIRS_BUILD)

$(SUBDIRS_BUILD):
	$(MAKE) -C $@ build

SUBDIRS_PUSH:=$(subst %,%@push,$(SUBDIRS))

push: $(SUBDIRS_PUSH)

$(SUBDIRS_PUSH):
	$(MAKE) -C $@ push

.PHONY: $(SUBDIRS) $(SUBDIRS_BUILD) $(SUBDIRS_PUSH)
