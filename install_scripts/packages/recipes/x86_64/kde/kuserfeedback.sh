#!/bin/bash

PACKAGE_NAME=kuserfeedback
VERSION=1.2.0
DOWNLOAD_URL=https://download.kde.org/stable/kuserfeedback/kuserfeedback-1.2.0.tar.xz
MD5_SUM=905f3e9686c15814594956bea084da64
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release  \
	      -DBUILD_TESTING=OFF         \
	      -Wno-dev .. &&
	make $MAKEFLAGS
    make install
}

