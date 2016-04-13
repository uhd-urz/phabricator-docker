#!/bin/bash

set -e

# if command begins with "start", prepend ./bin/aphlict
if [ "$1" = start ] || [ "$1" = debug ] ; then
	set -- ./bin/aphlict "$@"
fi

if [ "$1" = ./bin/aphlict ] ; then
	../bootstrap.sh

	./bin/config set --database notification.server-uri http://"${KUBE_POD_IP}":22281/
	./bin/config set --database notification.log /tmp/aphlict.log
	./bin/config set --database notification.enabled true

	echo ">> Starting service: $@"
fi

exec "$@"
