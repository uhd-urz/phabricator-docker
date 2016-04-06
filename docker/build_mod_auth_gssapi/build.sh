#!/bin/bash

set -e
set -x

cd /mod_auth_gssapi
autoreconf -fi
./configure
make -j$(nproc)
make DESTDIR=/target install
