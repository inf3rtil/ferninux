#!/bin/bash

PACKAGE_NAME=twm
VERSION=1.0.12
DOWNLOAD_URL=https://www.x.org/pub/individual/app/twm-1.0.12.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i -e '/^rcdir =/s,^\(rcdir = \).*,\1/etc/X11/app-defaults,' src/Makefile.in &&
	./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

