#!/bin/bash

PACKAGE_NAME=xfdesktop
VERSION=4.18.1
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfdesktop/4.18/xfdesktop-4.18.1.tar.bz2
MD5_SUM=e675c2989436dc724fef402d1db0125d
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

