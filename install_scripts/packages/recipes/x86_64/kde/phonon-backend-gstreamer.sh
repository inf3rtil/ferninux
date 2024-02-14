#!/bin/bash

PACKAGE_NAME=phonon-backend-gstreamer
VERSION=4.10.0
DOWNLOAD_URL=https://download.kde.org/stable/phonon/phonon-backend-gstreamer/4.10.0/phonon-backend-gstreamer-4.10.0.tar.xz
MD5_SUM=60abf634e961160cd1772d486f4a7097
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr    \
	      -DCMAKE_BUILD_TYPE=Release     \
	      .. &&
	make $MAKEFLAGS
    make install
}

