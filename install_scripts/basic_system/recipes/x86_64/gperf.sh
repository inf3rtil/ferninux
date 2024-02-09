#!/bin/bash

SRC_COMPRESSED_FILE=gperf-3.1.tar.gz
SRC_FOLDER=gperf-3.1

build_source_package(){
    ./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
    make $MAKEFLAGS
    make install
}

