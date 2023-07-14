#!/bin/bash

SRC_COMPRESSED_FILE=gawk-5.2.1.tar.xz 
SRC_FOLDER=gawk-5.2.1

build_source_package(){
    sed -i 's/extras//' Makefile.in
    ./configure --prefix=/usr
    make $MAKEFLAGS
    make LN='ln -f' install
    mkdir -pv /usr/share/doc/gawk-5.2.1
    cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.2.1
}

