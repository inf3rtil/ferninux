#!/bin/bash

PACKAGE_NAME=libXdmcp
VERSION=1.1.4
DOWNLOAD_URL=https://www.x.org/pub/individual/lib/libXdmcp-1.1.4.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG --docdir=/usr/share/doc/libXdmcp-$VERSION &&
	make $MAKEFLAGS
    make install
}

