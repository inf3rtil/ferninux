#!/bin/bash

SRC_COMPRESSED_FILE=man-pages-6.05.01.tar.xz
SRC_FOLDER=man-pages-6.05.01

build_source_package(){
    rm -v man3/crypt*
    make prefix=/usr install
}
