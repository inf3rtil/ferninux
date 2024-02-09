#!/bin/bash

SRC_COMPRESSED_FILE=man-db-2.11.2.tar.xz
SRC_FOLDER=man-db-2.11.2

build_source_package(){
    ./configure --prefix=/usr \
		--docdir=/usr/share/doc/man-db-2.11.2 \
		--sysconfdir=/etc \
		--disable-setuid \
		--enable-cache-owner=bin \
		--with-browser=/usr/bin/lynx \
		--with-vgrind=/usr/bin/vgrind \
		--with-grap=/usr/bin/grap
    make $MAKEFLAGS
    make install
}

