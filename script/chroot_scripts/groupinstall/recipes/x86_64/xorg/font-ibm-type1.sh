#!/bin/bash

PACKAGE_NAME="font-ibm-type1"
VERSION="ibm-type1-1.0.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-ibm-type1-1.0.4.tar.xz"
MD5_SUM="00f64a84b6c9886040241e081347a853"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
