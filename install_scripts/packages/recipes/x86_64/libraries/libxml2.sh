#!/bin/bash

PACKAGE_NAME=libxml2
VERSION=2.10.4
DOWNLOAD_URL=https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.4.tar.xz
MD5_SUM=76808c467a58c31e2dbd511e71d5fd13
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr           \
		--sysconfdir=/etc       \
		--disable-static        \
		--with-history          \
		PYTHON=/usr/bin/python3 \
		--docdir=/usr/share/doc/libxml2-2.10.4 &&
	make $MAKEFLAGS

    make install
}



