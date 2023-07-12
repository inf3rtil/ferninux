#!/bin/bash

SRC_COMPRESSED_FILE=texinfo-7.0.2.tar.xz
SRC_FOLDER=texinfo-7.0.2

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

