#!/bin/bash

PACKAGE_NAME="libxshmfence"
VERSION="1.3.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libxshmfence-1.3.2.tar.xz"
MD5_SUM="faa74f7483074ce7d4349e6bdc237497"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
