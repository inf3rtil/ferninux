#!/bin/bash

PACKAGE_NAME="plasma-remotecontrollers"
VERSION="5.27.7"
DOWNLOAD_URL="https://download.kde.org/stable/plasma/5.27.7/plasma-remotecontrollers-5.27.7.tar.xz"
MD5_SUM="fb25df16ef388f7dbfc163911e7828be"
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
