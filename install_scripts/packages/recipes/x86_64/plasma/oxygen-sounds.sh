#!/bin/bash

PACKAGE_NAME="oxygen-sounds"
VERSION="5.27.7"
DOWNLOAD_URL="https://download.kde.org/stable/plasma/5.27.7/oxygen-sounds-5.27.7.tar.xz"
MD5_SUM="08434c4829aefd689c877fe84baa5ad6"
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
