#!/bin/bash

PACKAGE_NAME=xf86-input-synaptics
VERSION=1.9.2
DOWNLOAD_URL=https://www.x.org/pub/individual/driver/xf86-input-synaptics-1.9.2.tar.xz
MD5_SUM=3b95e7baf4428b114e9910f999e96601
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

