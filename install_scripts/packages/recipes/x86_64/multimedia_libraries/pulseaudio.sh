#!/bin/bash

PACKAGE_NAME=pulseaudio
VERSION=16.1
DOWNLOAD_URL=https://www.freedesktop.org/software/pulseaudio/releases/pulseaudio-16.1.tar.xz
MD5_SUM=2c7b8ceb5d7337565c7314b4d6087ca8
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=/usr       \
              --buildtype=release \
              -Ddatabase=gdbm     \
              -Ddoxygen=false     \
              -Dbluez5=disabled   \
              ..                  &&
	ninja
    ninja install
    rm -fv /etc/dbus-1/system.d/pulseaudio-system.conf
}

