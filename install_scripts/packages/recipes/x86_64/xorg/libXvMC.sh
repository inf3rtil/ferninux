#!/bin/bash

PACKAGE_NAME="libXvMC"
VERSION="1.0.13"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXvMC-1.0.13.tar.xz"
MD5_SUM="11a358e7229fa28dc9801c1e64fe2e18"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
