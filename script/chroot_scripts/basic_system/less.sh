#!/bin/bash

SRC_COMPRESSED_FILE=less-643.tar.gz
SRC_FOLDER=less-643

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc
    make $MAKEFLAGS
    make install
}

