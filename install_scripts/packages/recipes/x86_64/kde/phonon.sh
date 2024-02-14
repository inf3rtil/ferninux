#!/bin/bash

PACKAGE_NAME=phonon
VERSION=4.11.1
DOWNLOAD_URL=https://download.kde.org/stable/phonon/4.11.1/phonon-4.11.1.tar.xz
MD5_SUM=d3df5ba646e4b3f11623d998caa40e74
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release  \
	      .. &&
	make $MAKEFLAGS
    make install
}

