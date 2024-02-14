#!/bin/bash

PACKAGE_NAME=shared-mime-info
VERSION=2.2
DOWNLOAD_URL=https://gitlab.freedesktop.org/xdg/shared-mime-info/-/archive/2.2/shared-mime-info-2.2.tar.gz
MD5_SUM=06cb9e92e4211dc53fd52b7bfd586c78
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release -Dupdate-mimedb=false .. &&
	ninja
    ninja install
}

