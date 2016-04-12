#!/bin/bash

set -e
set -x

cd /mod_auth_gssapi_build
exec make DESTDIR=/target install
