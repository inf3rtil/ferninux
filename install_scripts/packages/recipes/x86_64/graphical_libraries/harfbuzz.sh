#!/bin/bash

PACKAGE_NAME=harfbuzz
VERSION=8.1.1
DOWNLOAD_URL=https://github.com/harfbuzz/harfbuzz/releases/download/8.1.1/harfbuzz-8.1.1.tar.xz
MD5_SUM=f0040d0fc02cf94cac9f46a94c44c6de
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&
	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release  &&
	ninja
    ninja install
}

