#!/bin/bash

SRC_COMPRESSED_FILE=psmisc-23.6.tar.xz
SRC_FOLDER=psmisc-23.6

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

