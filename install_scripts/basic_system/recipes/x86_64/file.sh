#!/bin/bash

SRC_COMPRESSED_FILE=file-5.45.tar.gz
SRC_FOLDER=file-5.45

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

