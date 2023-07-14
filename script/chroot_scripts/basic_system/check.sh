#!/bin/bash

SRC_COMPRESSED_FILE=check-0.15.2.tar.gz
SRC_FOLDER=check-0.15.2

build_source_package(){
    ./configure --prefix=/usr --disable-static
    make $MAKEFLAGS
    make docdir=/usr/share/doc/check-0.15.2 install
}

