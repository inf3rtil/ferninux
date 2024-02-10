#!/bin/bash

PACKAGE_NAME=libdrm
VERSION=2.4.115
DOWNLOAD_URL=https://dri.freedesktop.org/libdrm/libdrm-2.4.115.tar.xz
MD5_SUM=5403981a20c964f4c893ff91393652bd
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=$XORG_PREFIX \
	      --buildtype=release   \
              -Dudev=true           \
              -Dvalgrind=disabled   \
              ..                    &&
	ninja
    ninja install
}

