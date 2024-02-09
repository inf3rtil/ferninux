#!/bin/bash

SRC_COMPRESSED_FILE=grep-3.11.tar.xz
SRC_FOLDER=grep-3.11

build_source_package(){
    sed -i "s/echo/#echo/" src/egrep.sh
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

