#!/bin/bash

PACKAGE_NAME=libvdpau
VERSION=1.5
DOWNLOAD_URL=https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/1.5/libvdpau-1.5.tar.bz2
MD5_SUM=148a192110e7a49d62c0bf9ef916c099
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=$XORG_PREFIX .. &&
	ninja
    ninja install
}

