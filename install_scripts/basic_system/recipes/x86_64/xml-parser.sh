#!/bin/bash

SRC_COMPRESSED_FILE=XML-Parser-2.46.tar.gz
SRC_FOLDER=XML-Parser-2.46

build_source_package(){
    perl Makefile.PL
    make $MAKEFLAGS
    make install
}

