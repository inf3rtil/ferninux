#!/bin/bash

PACKAGE_NAME=xfwm4
VERSION=4.18.0
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfwm4/4.18/xfwm4-4.18.0.tar.bz2
MD5_SUM=181415e457c86124fa5f8aa5d715b967
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

