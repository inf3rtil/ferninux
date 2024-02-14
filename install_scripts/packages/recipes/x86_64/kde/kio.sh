#!/bin/bash

PACKAGE_NAME="kio"
VERSION="5.109.0"
DOWNLOAD_URL="https://download.kde.org/stable/frameworks/5.109/kio-5.109.0.tar.xz"
MD5_SUM="73fc6504264e620b0f9d0ba96c9d8ca4"
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
