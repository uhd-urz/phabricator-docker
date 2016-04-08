#!/bin/bash

set -e

# if command starts with an option, prepend php5-fpm
if [ "${1:0:1}" = '-' ]; then
	set -- /usr/sbin/php5-fpm "$@"
fi

if [ "$1" = /usr/sbin/php5-fpm ] ; then
	../bootstrap.sh
fi

exec "$@"
