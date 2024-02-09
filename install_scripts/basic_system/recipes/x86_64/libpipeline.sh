#!/bin/bash

SRC_COMPRESSED_FILE=libpipeline-1.5.7.tar.gz
SRC_FOLDER=libpipeline-1.5.7

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

