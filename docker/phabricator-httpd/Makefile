PACKAGE:=phabricator-httpd

include ../docker.make

build: mod_auth_gssapi conf/mods-available/auth_gssapi.load webroot webroot/rsrc/sprint

mod_auth_gssapi: ../build_mod_auth_gssapi/target
	rsync -av --delete $</ $@/

../build_mod_auth_gssapi/target:
	make -C ../build_mod_auth_gssapi

conf/mods-available/auth_gssapi.load: ../../source/mod_auth_gssapi/example/10-auth_gssapi.conf conf/mods-available
	rsync -av $< $@
	file=`find ../build_mod_auth_gssapi/target -name mod_auth_gssapi.so | sed 's:../build_mod_auth_gssapi/target::'` ; sed "s:modules/mod_auth_gssapi.so:$${file}:" -i $@

conf/mods-available: conf
	mkdir $@

conf:
	mkdir $@

webroot: ../../source/phabricator/webroot
	rsync -av --delete $</ $@/

webroot/rsrc/sprint: ../../source/phabricator-extensions-sprint/rsrc webroot
	rsync -av --delete $</ $@/
