#!/bin/bash

PACKAGE_NAME=libcanberra
VERSION=0.30
DOWNLOAD_URL=https://0pointer.de/lennart/projects/libcanberra/libcanberra-0.30.tar.xz
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/libcanberra-0.30-wayland-1.patch
MD5_SUM=34cb7e4430afaf6f447c4ebdb9b42072
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../libcanberra-0.30-wayland-1.patch
    ./configure --prefix=/usr --disable-oss &&
	make $MAKEFLAGS
    make docdir=/usr/share/doc/libcanberra-0.30 install
}

