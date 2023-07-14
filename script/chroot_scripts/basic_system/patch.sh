#!/bin/bash

SRC_COMPRESSED_FILE=patch-2.7.6.tar.xz
SRC_FOLDER=patch-2.7.6

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

