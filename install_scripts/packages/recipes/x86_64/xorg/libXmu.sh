#!/bin/bash

PACKAGE_NAME="libXmu"
VERSION="1.1.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libXmu-1.1.4.tar.xz"
MD5_SUM="ed52d396115fbc4d05300762aab79685"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
