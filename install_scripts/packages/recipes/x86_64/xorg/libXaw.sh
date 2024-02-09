#!/bin/bash

PACKAGE_NAME="libXaw"
VERSION="1.0.15"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXaw-1.0.15.tar.xz"
MD5_SUM="3f1e1052dbf3a2b8582ec24137e1fbd1"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
