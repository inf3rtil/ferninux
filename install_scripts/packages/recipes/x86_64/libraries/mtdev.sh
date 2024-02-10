#!/bin/bash

PACKAGE_NAME=mtdev
VERSION=1.1.6
DOWNLOAD_URL=https://bitmath.org/code/mtdev/mtdev-1.1.6.tar.bz2
MD5_SUM=bf8ef2482e84a00b5db8fbd3ce00e249
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

