SUBDIRS:=phabricator-mysql phabricator-httpd phabricator-base phabricator-fpm phabricator-phd

all: build

SUBDIRS_BUILD:=$(patsubst %,%@build,$(SUBDIRS))

build: $(SUBDIRS_BUILD)

$(SUBDIRS_BUILD): %@build:
	$(MAKE) -C $* build

SUBDIRS_PUSH:=$(patsubst %,%@push,$(SUBDIRS))

push: $(SUBDIRS_PUSH)

$(SUBDIRS_PUSH): %@push:
	$(MAKE) -C $* push

SUBDIRS_CLEAN:=$(patsubst %,%@clean,$(SUBDIRS))

clean: $(SUBDIRS_CLEAN)

$(SUBDIRS_CLEAN): %@clean:
	$(MAKE) -C $* clean

.PHONY: all build push clean $(SUBDIRS) $(SUBDIRS_BUILD) $(SUBDIRS_PUSH) $(SUBDIRS_CLEAN)
