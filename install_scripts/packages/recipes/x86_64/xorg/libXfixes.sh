#!/bin/bash

PACKAGE_NAME="libXfixes"
VERSION="6.0.1"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXfixes-6.0.1.tar.xz"
MD5_SUM="65b9ba1e9ff3d16c4fa72915d4bb585a"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
