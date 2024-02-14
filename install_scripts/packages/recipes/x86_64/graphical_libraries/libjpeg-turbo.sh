#!/bin/bash

PACKAGE_NAME=libjpeg-turbo
VERSION=3.0.0
DOWNLOAD_URL=https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-3.0.0.tar.gz
MD5_SUM=aa1f0a1c72cb6772e34d9d5136267f56
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=RELEASE  \
	      -DENABLE_STATIC=FALSE       \
	      -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo-3.0.0 \
	      -DCMAKE_INSTALL_DEFAULT_LIBDIR=lib  \
	      .. &&
	make $MAKEFLAGS
    make install
}

