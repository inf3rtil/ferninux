#!/bin/bash

PACKAGE_NAME="font-bh-ttf"
VERSION="bh-ttf-1.0.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-bh-ttf-1.0.4.tar.xz"
MD5_SUM="063bfa1456c8a68208bf96a33f472bb1"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
