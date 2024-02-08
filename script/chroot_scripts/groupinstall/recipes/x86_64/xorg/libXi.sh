#!/bin/bash

PACKAGE_NAME="libXi"
VERSION="1.8.1
1.1.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXi-1.8.1.tar.xz
libXinerama-1.1.5.tar.xz"
MD5_SUM="89ac74ad6829c08d5c8ae8f48d363b06
228c877558c265d2f63c56a03f7d3f21"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_PREFIX --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
