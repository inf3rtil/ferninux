#!/bin/bash

PACKAGE_NAME=taglib
VERSION=1.13.1
DOWNLOAD_URL=https://taglib.org/releases/taglib-1.13.1.tar.gz
MD5_SUM=2fe6089da73ad414aa1b982b83415362
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release  \
	      -DBUILD_SHARED_LIBS=ON \
	      .. &&
	make $MAKEFLAGS
    make install
}

