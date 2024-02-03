#!/bin/bash

SRC_COMPRESSED_FILE=make-4.4.1.tar.gz
SRC_FOLDER=make-4.4.1

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

