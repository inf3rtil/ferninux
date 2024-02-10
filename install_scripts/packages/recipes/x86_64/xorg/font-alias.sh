#!/bin/bash

PACKAGE_NAME="font-alias"
VERSION="1.0.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-alias-1.0.5.tar.xz"
MD5_SUM="79f4c023e27d1db1dfd90d041ce89835"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
