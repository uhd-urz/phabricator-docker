FROM mysql:5.7
MAINTAINER Dennis Schridde <dennis.schridde@uni-heidelberg.de>
ENV DEBIAN_FRONTEND noninteractive

COPY phabricator.cnf /etc/mysql/conf.d/
COPY stopwords.txt /etc/mysql/
