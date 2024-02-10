#!/bin/bash

PACKAGE_NAME=pixman
VERSION=0.42.2
DOWNLOAD_URL=https://www.cairographics.org/releases/pixman-0.42.2.tar.gz
MD5_SUM=a0f6ab8a1d8e0e2cd80e935525e2a864
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release &&
	ninja
    ninja install
}

