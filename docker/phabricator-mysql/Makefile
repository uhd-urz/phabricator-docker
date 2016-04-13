PACKAGE:=phabricator-mysql
DEPENDENCIES:=stopwords.txt

TOPDIR:=../..
include ../docker.make

stopwords.txt: $(TOPDIR)/source/phabricator/resources/sql/stopwords.txt
	cp -a $< $@
