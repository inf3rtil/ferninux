#!/bin/bash

SRC_COMPRESSED_FILE=file-5.44.tar.gz
SRC_FOLDER=file-5.44

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

