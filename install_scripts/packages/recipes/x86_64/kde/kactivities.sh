#!/bin/bash

PACKAGE_NAME="kactivities"
VERSION="5.109.0"
DOWNLOAD_URL="https://download.kde.org/stable/frameworks/5.109/kactivities-5.109.0.tar.xz"
MD5_SUM="7111af3ca1d17b3b085513bf4067557e"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
   mkdir build
   cd build
   cmake -DCMAKE_INSTALL_PREFIX=$KF5_PREFIX      \
              -DCMAKE_PREFIX_PATH=$QT5DIR         \
              -DCMAKE_BUILD_TYPE=Release          \
              -DBUILD_TESTING=OFF                 \
              -Wno-dev ..
      make $MAKEFLAGS
      make install
      /sbin/ldconfig
}
