FROM urzds/phabricator-base
MAINTAINER Dennis Schridde <dennis.schridde@uni-heidelberg.de>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
	&& apt-get -y install php5-fpm python-pygments \
	&& sed -i /etc/php5/fpm/php.ini \
		-e '/^post_max_size/s,=.*$,= 64M,' \
		-e '/^;date.timezone/a \ \
			date.timezone = "Europe/Berlin"' \
		-e '/^;opcache.validate_timestamps/a \ \
			opcache.validate_timestamps = 0' \
	&& sed -i /etc/php5/fpm/php-fpm.conf \
		-e '/^pid /d' -e '/^error_log /s,=.*$,= /proc/self/fd/2,' \
	&& rm /etc/php5/fpm/pool.d/www.conf

COPY phab.conf /etc/php5/fpm/pool.d/

RUN useradd -m -d /var/lib/phd phd \
	&& usermod -aG phd www-data \
	&& mkdir /srv/phabricator \
	&& umask 0007 \
	&& mkdir /srv/phabricator/repo/ /srv/phabricator/storage/ \
	&& chown phd: /srv/phabricator/repo/ \
	&& chown www-data: /srv/phabricator/storage/

VOLUME /srv/phabricator/repo/ /srv/phabricator/storage/

WORKDIR /opt/phabricator/phabricator

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000
CMD ["--nodaemonize", "--fpm-config", "/etc/php5/fpm/php-fpm.conf"]
