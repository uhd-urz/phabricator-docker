FROM debian:8
MAINTAINER Dennis Schridde <dennis.schridde@uni-heidelberg.de>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install build-essential autoconf libtool pkg-config apache2-dev libkrb5-dev libssl-dev

ADD src/ /

RUN cd /mod_auth_gssapi \
	&& autoreconf -fi \
	&& mkdir /mod_auth_gssapi_build \
	&& cd /mod_auth_gssapi_build \
	&& /mod_auth_gssapi/configure \
	&& make -j$(nproc)

COPY install.sh /install.sh

VOLUME /target
ENTRYPOINT ["/install.sh"]
