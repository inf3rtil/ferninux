#!/bin/bash

SRC_COMPRESSED_FILE=gettext-0.21.1.tar.xz
SRC_FOLDER=gettext-0.21.1

build_source_package(){
    ./configure --disable-shared
    make $MAKEFLAGS
    cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
}

