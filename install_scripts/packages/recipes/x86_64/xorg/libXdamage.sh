#!/bin/bash

PACKAGE_NAME="libXdamage"
VERSION="1.1.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXdamage-1.1.6.tar.xz"
MD5_SUM="ca55d29fa0a8b5c4a89f609a7952ebf8"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
