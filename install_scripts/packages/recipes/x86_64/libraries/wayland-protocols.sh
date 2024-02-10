#!/bin/bash

PACKAGE_NAME=wayland-protocols
VERSION=1.32
DOWNLOAD_URL=https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.32/downloads/wayland-protocols-1.32.tar.xz
MD5_SUM=00c2cedb0d2df714a0965a00c19385c6
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&
	
	meson setup --prefix=/usr --buildtype=release &&
	ninja
    ninja install
}

