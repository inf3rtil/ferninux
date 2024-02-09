#!/bin/bash

SRC_COMPRESSED_FILE=libtool-2.4.7.tar.xz
SRC_FOLDER=libtool-2.4.7

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
    rm -fv /usr/lib/libltdl.a
}

