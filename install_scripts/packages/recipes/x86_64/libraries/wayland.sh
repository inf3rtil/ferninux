#!/bin/bash

PACKAGE_NAME=wayland
VERSION=1.22.0
DOWNLOAD_URL=https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
MD5_SUM=7410ab549e3928fce9381455b17b0803
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Ddocumentation=false &&
	ninja
    ninja install
}

