FROM debian:8
MAINTAINER Dennis Schridde <dennis.schridde@uni-heidelberg.de>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install build-essential autoconf libtool pkg-config apache2-dev libkrb5-dev libssl-dev

ADD src/ /

# Prepare for non-root build
RUN chmod -R a=rwX /mod_auth_gssapi

COPY build.sh /build.sh
ENTRYPOINT ["/build.sh"]

VOLUME /target
