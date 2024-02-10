#!/bin/bash

PACKAGE_NAME="libfontenc"
VERSION="1.1.7"
DOWNLOAD_URL="https://www.x.org/pub/individual/lib/libfontenc-1.1.7.tar.xz"
MD5_SUM="6d3f1b15bb5b0bb71ae9f0a5103c1fc4"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
