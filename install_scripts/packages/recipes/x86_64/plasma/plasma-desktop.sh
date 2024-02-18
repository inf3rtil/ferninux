#!/bin/bash

PACKAGE_NAME="plasma-desktop"
VERSION="5.27.7.1"
DOWNLOAD_URL="https://download.kde.org/stable/plasma/5.27.7/plasma-desktop-5.27.7.1.tar.xz"
MD5_SUM="7f7d2bea26b4d825c9a6e8d57e400a4a"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
       mkdir build
       cd    build

       cmake -DCMAKE_INSTALL_PREFIX=$KF5_PREFIX              -DCMAKE_BUILD_TYPE=Release                      -DBUILD_TESTING=OFF                             -Wno-dev ..  &&

        make $MAKEFLAGS
        make install
	/sbin/ldconfig
}
