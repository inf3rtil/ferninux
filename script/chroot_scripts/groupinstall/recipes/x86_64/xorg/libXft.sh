#!/bin/bash

PACKAGE_NAME="libXft"
VERSION="2.3.8"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXft-2.3.8.tar.xz"
MD5_SUM="cea0a3304e47a841c90fbeeeb55329ee"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
