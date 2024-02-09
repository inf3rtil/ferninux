#!/bin/bash

PACKAGE_NAME="font-util"
VERSION="util-1.4.0"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-util-1.4.0.tar.xz"
MD5_SUM="ec6cea7a46c96ed6be431dfbbb78f366"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
