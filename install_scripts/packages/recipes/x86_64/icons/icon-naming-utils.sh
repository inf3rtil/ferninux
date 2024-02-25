#!/bin/bash

PACKAGE_NAME=icon-naming-utils
VERSION=0.8.90
DOWNLOAD_URL=http://tango.freedesktop.org/releases/icon-naming-utils-0.8.90.tar.bz2
MD5_SUM=dd8108b56130b9eedc4042df634efa66
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

