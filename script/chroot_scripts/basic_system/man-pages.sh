#!/bin/bash

SRC_COMPRESSED_FILE=man-pages-6.03.tar.xz
SRC_FOLDER=man-pages-6.03

build_source_package(){
    make prefix=/usr install
}

