#!/bin/bash

PACKAGE_NAME=polkit-qt-1
VERSION=0.114.0
DOWNLOAD_URL=https://download.kde.org/stable/polkit-qt-1/polkit-qt-1-0.114.0.tar.xz
MD5_SUM=2d20b02bd7ad1cd3f6ce235fc6d7de60
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release  \
	      -Wno-dev .. &&
	make $MAKEFLAGS
    make install
}

