#!/bin/bash

SRC_COMPRESSED_FILE=zstd-1.5.5.tar.gz
SRC_FOLDER=zstd-1.5.5

build_source_package(){
    make $MAKEFLAGS prefix=/usr
    make prefix=/usr install
    rm -v /usr/lib/libzstd.a
}

