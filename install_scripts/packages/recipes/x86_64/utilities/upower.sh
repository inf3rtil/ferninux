#!/bin/bash

PACKAGE_NAME=upower
VERSION=v1.90.2
DOWNLOAD_URL=https://gitlab.freedesktop.org/upower/upower/-/archive/v1.90.2/upower-v1.90.2.tar.bz2
MD5_SUM=bfd6e3275e61d7e097b53eb2b216fffa
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed '/parse_version/d' -i src/linux/integration-test.py
    mkdir build                         &&
	cd    build                         &&
	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Dgtk-doc=false     \
	      -Dman=false         &&
	ninja
    ninja install
    systemctl enable upower
}

