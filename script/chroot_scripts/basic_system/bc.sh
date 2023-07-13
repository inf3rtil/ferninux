#!/bin/bash

SRC_COMPRESSED_FILE=bc-6.2.4.tar.xz
SRC_FOLDER=bc-6.2.4

build_source_package(){
    CC=gcc ./configure --prefix=/usr -G -O3 -r
    make $MAKEFLAGS
    make install
}

