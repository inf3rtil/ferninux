#!/bin/bash

PACKAGE_NAME=libepoxy
VERSION=1.5.10
DOWNLOAD_URL=https://download.gnome.org/sources/libepoxy/1.5/libepoxy-1.5.10.tar.xz
MD5_SUM=10c635557904aed5239a4885a7c4efb7
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

