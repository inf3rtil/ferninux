#!/bin/bash

PACKAGE_NAME=libical
VERSION=3.0.16
DOWNLOAD_URL=https://github.com/libical/libical/releases/download/v3.0.16/libical-3.0.16.tar.gz
MD5_SUM=3799f9dde1db6f7eb0cb112b5e14ab60
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr  \
	      -DCMAKE_BUILD_TYPE=Release   \
	      -DSHARED_ONLY=yes            \
	      -DICAL_BUILD_DOCS=false      \
	      -DGOBJECT_INTROSPECTION=true \
	      -DICAL_GLIB_VAPI=true        \
	      .. &&
	make -j1
    make install
}

