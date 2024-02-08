#!/bin/bash

PACKAGE_NAME=xinit
VERSION=1.4.2
DOWNLOAD_URL=https://www.x.org/pub/individual/app/xinit-1.4.2.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG --with-xinitdir=/etc/X11/app-defaults &&
	make $MAKEFLAGS
    make install &&
	ldconfig
}

