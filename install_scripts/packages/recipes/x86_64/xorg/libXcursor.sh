#!/bin/bash

PACKAGE_NAME="libXcursor"
VERSION="1.2.1"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXcursor-1.2.1.tar.xz"
MD5_SUM="4cdd1886fe5cce6f68554296edb46db8"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
