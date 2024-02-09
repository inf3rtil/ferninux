#!/bin/bash

PACKAGE_NAME="libXtst"
VERSION="1.2.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXtst-1.2.4.tar.xz"
MD5_SUM="02f128fbf809aa9c50d6e54c8e57cb2e"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
