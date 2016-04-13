FROM debian:8
MAINTAINER Dennis Schridde <dennis.schridde@uni-heidelberg.de>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install apache2 libgssapi-krb5-2

# Use ADD, because we want the files to be owned by root:root instead of to original user
ADD mod_auth_gssapi/ /
COPY conf/ /etc/apache2/
COPY webroot/ /var/www/phabricator/

RUN a2enmod rewrite proxy_fcgi proxy_wstunnel ssl session_cookie auth_gssapi \
	&& a2dissite 000-default \
	&& a2disconf other-vhosts-access-log \
	&& sed -i /etc/apache2/apache2.conf \
		-e 's,^ErrorLog.*$,ErrorLog /proc/self/fd/2,' \
		-e '/^ErrorLog/a \ \
			CustomLog /proc/self/fd/1 vhost_combined'

ENV APACHE_ARGUMENTS="-D FOREGROUND"

EXPOSE 80 443
CMD ["/usr/sbin/apache2ctl", "start"]
