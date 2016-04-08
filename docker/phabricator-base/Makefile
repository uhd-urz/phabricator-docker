PACKAGE:=phabricator-base

include ../docker.make

build: src/arcanist src/libphutil src/phabricator src/phabricator/src/extensions src/phabricator-extensions-remoteuser src/phabricator-extensions-sprint src/PHPExcel

src:
	mkdir src

src/%: ../../source/% src
	rsync -av --delete $</ $@/

src/phabricator/src/extensions: ../../source/phabricator-extensions-urz
	rsync -av --delete $</ $@/
