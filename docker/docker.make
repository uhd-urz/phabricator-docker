ifdef DOCKER_USERNAME
PACKAGE:=$(DOCKER_USERNAME)/$(PACKAGE)
endif

include $(TOPDIR)/docker/version.make

build: $(DEPENDENCIES)
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

.PHONY: build push clean
