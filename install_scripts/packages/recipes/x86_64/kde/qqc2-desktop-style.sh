#!/bin/bash

PACKAGE_NAME="qqc2-desktop-style"
VERSION="5.109.0"
DOWNLOAD_URL="https://download.kde.org/stable/frameworks/5.109/qqc2-desktop-style-5.109.0.tar.xz"
MD5_SUM="12f3d0a80404bcd1111f5164d8e9dfd0"
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
