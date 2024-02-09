#!/bin/bash

SRC_COMPRESSED_FILE=automake-1.16.5.tar.xz
SRC_FOLDER=automake-1.16.5

build_source_package(){
    ./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5
    make $MAKEFLAGS
    make install
}

