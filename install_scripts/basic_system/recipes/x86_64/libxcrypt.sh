#!/bin/bash

SRC_COMPRESSED_FILE=libxcrypt-4.4.36.tar.xz
SRC_FOLDER=libxcrypt-4.4.36

build_source_package(){
    ./configure --prefix=/usr                \
            --enable-hashes=strong,glibc \
            --enable-obsolete-api=no     \
            --disable-static             \
            --disable-failure-tokens
    make $MAKEFLAGS
    make install
}
