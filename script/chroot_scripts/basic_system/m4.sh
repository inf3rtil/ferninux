#!/bin/bash

SRC_COMPRESSED_FILE=m4-1.4.19.tar.xz
SRC_FOLDER=m4-1.4.19

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

