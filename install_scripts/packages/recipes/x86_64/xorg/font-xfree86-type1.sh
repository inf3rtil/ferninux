#!/bin/bash

PACKAGE_NAME="font-xfree86-type1"
VERSION="1.0.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-xfree86-type1-1.0.5.tar.xz"
MD5_SUM="3b47fed2c032af3a32aad9acc1d25150"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
