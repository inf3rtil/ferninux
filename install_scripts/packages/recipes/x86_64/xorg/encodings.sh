#!/bin/bash

PACKAGE_NAME="encodings"
VERSION="1.0.7"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/encodings-1.0.7.tar.xz"
MD5_SUM="357d91d87c5d5a1ac3ea4e6a6daf833d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
