FROM debian:8
MAINTAINER Dennis Schridde <dennis.schridde@uni-heidelberg.de>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
	&& apt-get -y install php5-cli php5-apcu php5-curl php5-gd php5-ldap php5-mysql nullmailer

COPY src/ bootstrap.sh /opt/phabricator/
