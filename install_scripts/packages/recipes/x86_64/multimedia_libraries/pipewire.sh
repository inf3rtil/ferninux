#!/bin/bash

PACKAGE_NAME=pipewire
VERSION=0.3.77
DOWNLOAD_URL=https://github.com/PipeWire/pipewire/archive/0.3.77/pipewire-0.3.77.tar.gz
MD5_SUM=04906e549ffd8feb1caad23f687c5257
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup ..                \
	      --prefix=/usr           \
	      --buildtype=release     \
	      -Dsession-managers="[]" &&
	ninja
    

    rm -vf /usr/bin/pipewire-*
    ninja install
}

