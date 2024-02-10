#!/bin/bash

PACKAGE_NAME="sgnidocne"
VERSION=""
DOWNLOAD_URL="https://www.x.org/pub/individual/font/"
MD5_SUM=""
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure --docdir=$XORG_PREFIX/share/doc/$PACKAGE_NAME-$VERSION
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
