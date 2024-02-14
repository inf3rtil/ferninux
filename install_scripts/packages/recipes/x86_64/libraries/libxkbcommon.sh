#!/bin/bash

PACKAGE_NAME=libxkbcommon
VERSION=1.5.0
DOWNLOAD_URL=https://xkbcommon.org/download/libxkbcommon-1.5.0.tar.xz
MD5_SUM=40f0486b4eb491928ec6616c2ff85120
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Denable-docs=false &&
	ninja
    ninja install
}

