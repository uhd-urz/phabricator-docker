#!/bin/bash

set -e

for var in MYSQL_{USER,PASSWORD} ; do
	if [ -z "${!var+x}" ] ; then
		echo "${var} is not set!" >& 2
		exit 1
	fi
done

scriptdir="$(dirname $(realpath "$0"))"

cd "${scriptdir}/phabricator"

echo ">> Seed local configuration ..."
cp /srv/phabricator/config/* conf/local/

echo ">> Bootstrapping local configuration ..."
./bin/config set mysql.host "${MYSQL_HOST:-localhost}"
./bin/config set mysql.port "${MYSQL_PORT:-3306}"
./bin/config set mysql.user "${MYSQL_USER}"
./bin/config set mysql.pass "${MYSQL_PASSWORD}"
./bin/config set storage.default-namespace "${MYSQL_NAMESPACE:-phabricator}"

echo ">> Configuration:"
cat conf/local/local.json

echo ">> Upgrading database ..."
./bin/storage upgrade --force
