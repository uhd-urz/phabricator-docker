PACKAGE:=phabricator-mysql

include ../docker.make

build: stopwords.txt

stopwords.txt: $(TOPDIR)/source/phabricator/resources/sql/stopwords.txt
	cp -a $< $@
