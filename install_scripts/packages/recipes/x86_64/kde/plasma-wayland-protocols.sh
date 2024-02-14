#!/bin/bash

PACKAGE_NAME=plasma-wayland-protocols 
VERSION=1.10.0
DOWNLOAD_URL=https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-1.10.0.tar.xz
MD5_SUM=28ae1490011ff205cbf8d99be6dd124f
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make install
}

