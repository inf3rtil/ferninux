#!/bin/bash

PACKAGE_NAME=libgudev
VERSION=238
DOWNLOAD_URL=https://download.gnome.org/sources/libgudev/238/libgudev-238.tar.xz
MD5_SUM=46da30a1c69101c3a13fa660d9ab7b73
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

