#!/bin/bash

PACKAGE_NAME="libX11"
VERSION="1.8.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libX11-1.8.6.tar.xz"
MD5_SUM="91752155473ef72a8b34523a65967e4d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
