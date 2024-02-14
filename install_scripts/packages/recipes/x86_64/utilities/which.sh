#!/bin/bash

PACKAGE_NAME=which
VERSION=2.21
DOWNLOAD_URL=https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
MD5_SUM=097ff1a324ae02e0a3b0369f07a7544a
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

