#!/bin/bash

PACKAGE_NAME=libxslt
VERSION=1.1.38
DOWNLOAD_URL=https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.38.tar.xz
MD5_SUM=7d6e43db810177ddf9818ef394027019
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                          \
		--disable-static                       \
		--docdir=/usr/share/doc/libxslt-1.1.38 \
		PYTHON=/usr/bin/python3 &&
	make $MAKEFLAGS
    make install
}

