#!/bin/bash

PACKAGE_NAME=libarchive
VERSION=3.7.1
DOWNLOAD_URL=https://github.com/libarchive/libarchive/releases/download/v3.7.1/libarchive-3.7.1.tar.xz
MD5_SUM=11a217b523dcdd178490bdb1f83353f3
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

