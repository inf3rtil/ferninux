#!/bin/bash

PACKAGE_NAME=pycairo
VERSION=1.24.0
DOWNLOAD_URL=https://github.com/pygobject/pycairo/releases/download/v1.24.0/pycairo-1.24.0.tar.gz
MD5_SUM=9855a7b7a813d73b54a29f8b43529dea
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr --buildtype=release .. &&
	ninja
    ninja install
}

