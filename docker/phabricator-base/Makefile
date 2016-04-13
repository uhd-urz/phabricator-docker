PACKAGE:=phabricator-base
DEPENDENCIES:=src/arcanist src/libphutil src/phabricator src/phabricator/src/extensions src/phabricator-extensions-remoteuser src/phabricator-extensions-sprint src/PHPExcel

TOPDIR:=../..
include ../docker.make

src:
	mkdir src

src/%: ../../source/% src
	rsync -av --delete --exclude=.git $</ $@/

src/phabricator/src/extensions: ../../source/phabricator-extensions-urz
	rsync -av --delete --exclude=.git $</ $@/
