#!/bin/bash

SRC_COMPRESSED_FILE=groff-1.23.0.tar.gz
SRC_FOLDER=groff-1.23.0

build_source_package(){
    PAGE=A4 ./configure --prefix=/usr
    make $MAKEFLAGS
    make install
}

