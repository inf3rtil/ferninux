#!/bin/bash

PACKAGE_NAME=giflib
VERSION=5.2.1
DOWNLOAD_URL=https://sourceforge.net/projects/giflib/files/giflib-5.2.1.tar.gz
MD5_SUM=6f03aee4ebe54ac2cc1ab3e4b0a049e5
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    make $MAKEFLAGS
    make PREFIX=/usr install &&

	rm -fv /usr/lib/libgif.a &&

	find doc \( -name Makefile\* -o -name \*.1 \
             -o -name \*.xml \) -exec rm -v {} \; &&

	install -v -dm755 /usr/share/doc/giflib-5.2.1 &&
	cp -v -R doc/* /usr/share/doc/giflib-5.2.1
}

