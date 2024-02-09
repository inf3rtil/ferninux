#!/bin/bash

SRC_COMPRESSED_FILE=gdbm-1.23.tar.gz
SRC_FOLDER=gdbm-1.23

build_source_package(){
    ./configure --prefix=/usr \
		--disable-static \
		--enable-libgdbm-compat
    make $MAKEFLAGS
    make install
}

