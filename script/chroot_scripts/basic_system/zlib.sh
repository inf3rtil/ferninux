#!/bin/bash

SRC_COMPRESSED_FILE=zlib-1.2.13.tar.xz
SRC_FOLDER=zlib-1.2.13

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
    rm -fv /usr/lib/libz.a
}

