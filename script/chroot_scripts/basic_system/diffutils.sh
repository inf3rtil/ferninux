#!/bin/bash

SRC_COMPRESSED_FILE=diffutils-3.9.tar.xz
SRC_FOLDER=diffutils-3.9

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

