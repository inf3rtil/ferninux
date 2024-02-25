#!/bin/bash

PACKAGE_NAME=thunar-volman
VERSION=4.18.0
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/thunar-volman/4.18/thunar-volman-4.18.0.tar.bz2
MD5_SUM=a0965931e78fe662ad134e63b1ab33b9
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

