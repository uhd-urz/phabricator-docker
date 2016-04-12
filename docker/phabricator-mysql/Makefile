PACKAGE:=phabricator-mysql
DEPENDENCIES:=stopwords.txt

include ../docker.make


stopwords.txt: $(TOPDIR)/source/phabricator/resources/sql/stopwords.txt
	cp -a $< $@
