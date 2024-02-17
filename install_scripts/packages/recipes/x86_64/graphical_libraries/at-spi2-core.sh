#!/bin/bash

PACKAGE_NAME=at-spi2-core
VERSION=2.48.3
DOWNLOAD_URL=https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.3.tar.xz
MD5_SUM=4ef1875d9e7035f672d494b997c892af
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

