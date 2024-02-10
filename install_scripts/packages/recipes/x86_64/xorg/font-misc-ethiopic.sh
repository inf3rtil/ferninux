#!/bin/bash

PACKAGE_NAME="font-misc-ethiopic"
VERSION="1.0.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-misc-ethiopic-1.0.5.tar.xz"
MD5_SUM="fe972eaf13176fa9aa7e74a12ecc801a"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
