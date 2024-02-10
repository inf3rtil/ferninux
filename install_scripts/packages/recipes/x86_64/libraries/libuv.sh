#!/bin/bash

PACKAGE_NAME=libuv
VERSION=v1.46.0
DOWNLOAD_URL=https://dist.libuv.org/dist/v1.46.0/libuv-v1.46.0.tar.gz
MD5_SUM=fa56dafe664d21f9568adebc428d2d64
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sh autogen.sh                              &&
	./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

