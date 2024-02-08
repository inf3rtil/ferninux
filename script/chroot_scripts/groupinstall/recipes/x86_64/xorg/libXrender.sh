#!/bin/bash

PACKAGE_NAME="libXrender"
VERSION="0.9.11"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXrender-0.9.11.tar.xz"
MD5_SUM="ebf7fb3241ec03e8a3b2af72f03b4631"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
