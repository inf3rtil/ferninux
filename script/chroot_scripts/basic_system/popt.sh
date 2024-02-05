#!/bin/bash

SRC_COMPRESSED_FILE=popt-1.19.tar.gz
SRC_FOLDER=popt-1.19

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}
