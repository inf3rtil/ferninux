#!/bin/bash

PACKAGE_NAME=sassc
VERSION=3.6.2
DOWNLOAD_URL=https://github.com/sass/sassc/archive/3.6.2/sassc-3.6.2.tar.gz
DOWNLOAD_URL_1=https://github.com/sass/libsass/archive/3.6.5/libsass-3.6.5.tar.gz
MD5_SUM=4c3b06ce2979f2a9f0a35093e501d8bb
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    tar -xf ../libsass-3.6.5.tar.gz &&
	pushd libsass-3.6.5 &&
	
	autoreconf -fi &&
	
	./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
    popd &&
	autoreconf -fi &&

	./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

