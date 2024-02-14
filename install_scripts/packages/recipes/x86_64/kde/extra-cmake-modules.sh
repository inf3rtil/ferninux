#!/bin/bash

PACKAGE_NAME=extra-cmake-modules
VERSION=5.109.0
DOWNLOAD_URL=https://download.kde.org/stable/frameworks/5.109/extra-cmake-modules-5.109.0.tar.xz
MD5_SUM=0baf0a3ded2fed5e0442591dde276c4e
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i '/"lib64"/s/64//' kde-modules/KDEInstallDirsCommon.cmake &&

	sed -e '/PACKAGE_INIT/i set(SAVE_PACKAGE_PREFIX_DIR "${PACKAGE_PREFIX_DIR}")' \
	    -e '/^include/a set(PACKAGE_PREFIX_DIR "${SAVE_PACKAGE_PREFIX_DIR}")' \
	    -i ECMConfig.cmake.in &&

	mkdir build &&
	cd    build &&

	cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
	make $MAKEFLAGS
    make install
}

