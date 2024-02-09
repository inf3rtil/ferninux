#!/bin/bash

SRC_COMPRESSED_FILE=efivar-38.tar.bz2
SRC_FOLDER=efivar-38

build_source_package(){
    sed '/prep :/a\\ttouch prep' -i src/Makefile
    make $MAKEFLAGS ERRORS=
    make install LIBDIR=/usr/lib
}
