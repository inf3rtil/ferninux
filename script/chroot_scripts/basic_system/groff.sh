#!/bin/bash

SRC_COMPRESSED_FILE=groff-1.22.4.tar.gz
SRC_FOLDER=groff-1.22.4

build_source_package(){
    PAGE=A4 ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

