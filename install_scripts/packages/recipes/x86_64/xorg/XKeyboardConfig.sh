#!/bin/bash

PACKAGE_NAME=XKeyboardConfig
VERSION=2.39
DOWNLOAD_URL=https://www.x.org/pub/individual/data/xkeyboard-config/xkeyboard-config-2.39.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=$XORG_PREFIX --buildtype=release .. &&
	ninja
    ninja install

}

