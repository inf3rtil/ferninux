#!/bin/bash

SRC_COMPRESSED_FILE=Python-3.11.2.tar.xz
SRC_FOLDER=Python-3.11.2

build_source_package(){
    ./configure --prefix=/usr \
		--enable-shared \
		--without-ensurepip
    make $MAKEFLAGS
    make install
}

