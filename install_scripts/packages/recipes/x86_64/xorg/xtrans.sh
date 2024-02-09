#!/bin/bash

PACKAGE_NAME="xtrans"
VERSION="1.5.0"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/xtrans-1.5.0.tar.xz"
MD5_SUM="12344cd74a1eb25436ca6e6a2cf93097"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
