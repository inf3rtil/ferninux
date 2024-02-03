#!/bin/bash

SRC_COMPRESSED_FILE=bc-6.6.0.tar.xz
SRC_FOLDER=bc-6.6.0

build_source_package(){
    CC=gcc ./configure --prefix=/usr -G -O3 -r
    make $MAKEFLAGS
    make install
}

