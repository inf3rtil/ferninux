#!/bin/bash

PACKAGE_NAME=qrencode
VERSION=4.1.1
DOWNLOAD_URL=https://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.bz2
MD5_SUM=de7185bcab635a34730e1b73d4efa705
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

