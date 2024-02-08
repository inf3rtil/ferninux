#!/bin/bash

PACKAGE_NAME=xf86-input-evdev
VERSION=2.10.6
DOWNLOAD_URL=https://www.x.org/pub/individual/driver/xf86-input-evdev-2.10.6.tar.bz2
MD5_SUM=e8bd1edc6751f92e425cae7eba3c61eb
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

