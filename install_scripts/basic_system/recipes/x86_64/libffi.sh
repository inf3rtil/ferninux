#!/bin/bash

SRC_COMPRESSED_FILE=libffi-3.4.4.tar.gz
SRC_FOLDER=libffi-3.4.4

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--with-gcc-arch=native
    make $MAKEFLAGS
    make install
}

