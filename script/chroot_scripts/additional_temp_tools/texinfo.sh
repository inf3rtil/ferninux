#!/bin/bash

SRC_COMPRESSED_FILE=texinfo-7.0.3.tar.xz
SRC_FOLDER=texinfo-7.0.3

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

