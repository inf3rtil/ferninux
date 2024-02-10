#!/bin/bash

PACKAGE_NAME=libpng
VERSION=1.6.40
DOWNLOAD_URL=https://downloads.sourceforge.net/libpng/libpng-1.6.40.tar.xz
DOWNLOAD_URL_1=https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-1.6.39-apng.patch.gz
MD5_SUM=6c7fe9dbb80c89c3579bedad9722e559
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    gzip -cd ../libpng-1.6.39-apng.patch.gz | patch -p1
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install &&
	mkdir -v /usr/share/doc/libpng-1.6.40 &&
	cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.40
}

