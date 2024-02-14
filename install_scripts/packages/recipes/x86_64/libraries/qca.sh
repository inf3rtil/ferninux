#!/bin/bash

PACKAGE_NAME=qca
VERSION=2.3.7
DOWNLOAD_URL=https://download.kde.org/stable/qca/2.3.7/qca-2.3.7.tar.xz
MD5_SUM=0e50817de610e145c83ca012f79f18f5
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i 's@cert.pem@certs/ca-bundle.crt@' CMakeLists.txt
    mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=$QT5DIR            \
	      -DCMAKE_BUILD_TYPE=Release                \
	      -DQCA_MAN_INSTALL_DIR:PATH=/usr/share/man \
	      .. &&
	make $MAKEFLAGS
    make install
}

