#!/bin/bash

SRC_COMPRESSED_FILE=less-608.tar.gz
SRC_FOLDER=less-608

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc
    make $MAKEFLAGS
    make install
}

