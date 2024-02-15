#!/bin/bash

PACKAGE_NAME=shadow
VERSION=4.13
DOWNLOAD_URL=https://github.com/shadow-maint/shadow/releases/download/4.13/shadow-4.13.tar.xz
MD5_SUM=b1ab01b5462ddcf43588374d57bec123
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i 's/groups$(EXEEXT) //' src/Makefile.in          &&

	find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \; &&
	find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; &&
	find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \; &&

	sed -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD YESCRYPT@' \
	    -e 's@/var/spool/mail@/var/mail@'                   \
	    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
	    -i etc/login.defs                                   &&
	
	./configure --sysconfdir=/etc               \
		    --disable-static                \
		    --with-{b,yes}crypt             \
		    --with-group-name-max-length=32 &&
	make $MAKEFLAGS
    make exec_prefix=/usr install
    make -C man install-man
}

