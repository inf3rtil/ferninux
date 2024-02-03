#!/bin/bash

SRC_COMPRESSED_FILE=xz-5.4.4.tar.xz
SRC_FOLDER=xz-5.4.4

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--docdir=/usr/share/doc/xz-5.4.4
    make $MAKEFLAGS
    make install
}

