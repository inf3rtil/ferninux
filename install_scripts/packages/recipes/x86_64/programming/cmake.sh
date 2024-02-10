#!/bin/bash

PACKAGE_NAME=cmake
VERSION=3.27.2
DOWNLOAD_URL=https://cmake.org/files/v3.27/cmake-3.27.2.tar.gz
MD5_SUM=
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake &&

	./bootstrap --prefix=/usr        \
		    --system-libs        \
		    --mandir=/share/man  \
		    --no-system-jsoncpp  \
		    --no-system-cppdap   \
		    --no-system-librhash \
		    --docdir=/share/doc/cmake-3.27.2 &&
	make $MAKEFLAGS
    make install
}

