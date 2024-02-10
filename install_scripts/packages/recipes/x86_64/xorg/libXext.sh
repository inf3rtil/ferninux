#!/bin/bash

PACKAGE_NAME="libXext"
VERSION="1.3.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXext-1.3.5.tar.xz"
MD5_SUM="964942427fcc5a9fa0539661421857c8"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
