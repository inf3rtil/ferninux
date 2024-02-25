#!/bin/bash

PACKAGE_NAME=xfce4-appfinder
VERSION=4.18.1
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfce4-appfinder/4.18/xfce4-appfinder-4.18.1.tar.bz2
MD5_SUM=621d811f93b3edaac4a0205bc18ef5c5
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

