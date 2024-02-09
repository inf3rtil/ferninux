#!/bin/bash

PACKAGE_NAME="libXres"
VERSION="1.2.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXres-1.2.2.tar.xz"
MD5_SUM="66c9e9e01b0b53052bb1d02ebf8d7040"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
