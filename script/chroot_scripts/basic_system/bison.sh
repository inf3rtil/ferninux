#!/bin/bash

SRC_COMPRESSED_FILE=bison-3.8.2.tar.xz
SRC_FOLDER=bison-3.8.2

build_source_package(){
    ./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
    make $MAKEFLAGS
    make install
}

