#!/bin/bash

PACKAGE_NAME="libXi"
VERSION="1.8.1"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXi-1.8.1.tar.xz"
MD5_SUM="89ac74ad6829c08d5c8ae8f48d363b06"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
