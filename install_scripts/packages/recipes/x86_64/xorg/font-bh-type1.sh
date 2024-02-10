#!/bin/bash

PACKAGE_NAME="font-bh-type1"
VERSION="1.0.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-bh-type1-1.0.4.tar.xz"
MD5_SUM="51a17c981275439b85e15430a3d711ee"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
