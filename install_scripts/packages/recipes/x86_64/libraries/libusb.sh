#!/bin/bash

PACKAGE_NAME=libusb
VERSION=1.0.26
DOWNLOAD_URL=https://github.com/libusb/libusb/releases/download/v1.0.26/libusb-1.0.26.tar.bz2
MD5_SUM=9c75660dfe1d659387c37b28c91e3160
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

