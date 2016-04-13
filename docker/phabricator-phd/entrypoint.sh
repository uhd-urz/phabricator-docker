#!/bin/bash

set -e

onexit() {
	echo ">> Stopping daemons ..."
	./bin/phd stop
}

# if command starts with an option, prepend mysqld
if [ "$1" = start ]; then
	set -- ./bin/phd "$@"
fi

if [ "$1" = ./bin/phd ] ; then
	../bootstrap.sh

	trap onexit EXIT

	echo ">> Starting daemons: $@"
	"$@"

	echo ">> Waiting for daemons to come up ..."
	while ! test -f /var/tmp/phd/pid/daemon.* ; do
		sleep 1
	done

	pid="$(echo /var/tmp/phd/pid/daemon.* | sed 's/^.*daemon\.//')"

	echo ">> Running watchdog ..."
	while kill -0 "${pid}" ; do
		sleep 10
	done
else
	exec "$@"
fi
