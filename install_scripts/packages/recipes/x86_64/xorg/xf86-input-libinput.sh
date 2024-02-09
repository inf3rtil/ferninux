#!/bin/bash

PACKAGE_NAME=xf86-input-libinput
VERSION=1.3.0
DOWNLOAD_URL=https://www.x.org/pub/individual/driver/xf86-input-libinput-1.3.0.tar.xz
MD5_SUM=92e9a50c8e4001fd25c813ffb1c84235
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

