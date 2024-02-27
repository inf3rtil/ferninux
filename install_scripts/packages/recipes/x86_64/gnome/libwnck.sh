#!/bin/bash

PACKAGE_NAME=libwnck
VERSION=43.0
DOWNLOAD_URL=https://download.gnome.org/sources/libwnck/43/libwnck-43.0.tar.xz
MD5_SUM=cd21ef743a1e9286554401c5b28d5ec6
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

