#!/bin/bash

PACKAGE_NAME=libdbusmenu-qt 
VERSION=0.9.3+16.04.20160218
DOWNLOAD_URL=https://launchpad.net/ubuntu/+archive/primary/+files/libdbusmenu-qt_0.9.3+16.04.20160218.orig.tar.gz
MD5_SUM=8b90312bd8654e026d814d4db986ce5e
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release  \
	      -DWITH_DOC=OFF              \
	      -Wno-dev .. &&
	make $MAKEFLAGS
    make install
}

