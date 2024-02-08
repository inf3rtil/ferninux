#!/bin/bash

PACKAGE_NAME=libxcvt
VERSION=0.1.2
DOWNLOAD_URL=https://www.x.org/pub/individual/lib/libxcvt-0.1.2.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=$XORG_PREFIX --buildtype=release .. &&
	ninja
    ninja install

}

