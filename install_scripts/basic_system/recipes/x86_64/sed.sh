#!/bin/bash

SRC_COMPRESSED_FILE=sed-4.9.tar.xz
SRC_FOLDER=sed-4.9

build_source_package(){
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make html
    make install
    install -d -m755 /usr/share/doc/sed-4.9
    install -m644 doc/sed.html /usr/share/doc/sed-4.9
}

