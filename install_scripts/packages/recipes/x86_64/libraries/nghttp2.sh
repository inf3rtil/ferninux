#!/bin/bash

PACKAGE_NAME=nghttp2
VERSION=1.55.1
DOWNLOAD_URL=https://github.com/nghttp2/nghttp2/releases/download/v1.55.1/nghttp2-1.55.1.tar.xz
MD5_SUM=5af6a7ee55dc96661aa8649636b68763
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr     \
		--disable-static  \
		--enable-lib-only \
		--docdir=/usr/share/doc/nghttp2-1.55.1 &&
	make $MAKEFLAGS
    make install
}

