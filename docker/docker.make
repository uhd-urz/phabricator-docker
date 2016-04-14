ifdef DOCKER_USERNAME
PACKAGE:=$(DOCKER_USERNAME)/$(PACKAGE)
else
$(error You need to set DOCKER_USERNAME!)
endif

include $(TOPDIR)/docker/version.make

ifndef COMMIT
$(error Unable to determine latest commit!)
endif

all: build

Dockerfile: Dockerfile.in
	cp $< $@
	sed -ri $@ \
		-e "s/@COMMIT@/$(COMMIT)/" \
		-e "s/@DOCKER_USERNAME@/$(DOCKER_USERNAME)/"

build: Dockerfile $(DEPENDENCIES)
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

push:
	docker push $(PACKAGE)

clean:
	$(RM) Dockerfile

.PHONY: build push clean Dockerfile
