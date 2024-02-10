#!/bin/bash

PACKAGE_NAME="libXv"
VERSION="1.0.12"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXv-1.0.12.tar.xz"
MD5_SUM="70bfdd14ca1a563c218794413f0c1f42"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
