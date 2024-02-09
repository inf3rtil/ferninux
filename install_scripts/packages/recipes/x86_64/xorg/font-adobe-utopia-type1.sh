#!/bin/bash

PACKAGE_NAME="font-adobe-utopia-type1"
VERSION="adobe-utopia-type1-1.0.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/font/font-adobe-utopia-type1-1.0.5.tar.xz"
MD5_SUM="546d17feab30d4e3abcf332b454f58ed"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
	./configure $XORG_CONFIG
	make $MAKEFLAGS
	make install
	/sbin/ldconfig
}
