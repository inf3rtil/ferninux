#!/bin/bash

PACKAGE_NAME="plasma-thunderbolt"
VERSION="5.27.7"
DOWNLOAD_URL="https://download.kde.org/stable/plasma/5.27.7/plasma-thunderbolt-5.27.7.tar.xz"
MD5_SUM="fa9f2208c27d8a3e99c0cbb113087338"
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
