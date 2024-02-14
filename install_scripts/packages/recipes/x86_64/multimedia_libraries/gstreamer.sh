#!/bin/bash

PACKAGE_NAME=gstreamer
VERSION=1.22.5
DOWNLOAD_URL=https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.5.tar.xz
MD5_SUM=b138307f1f84ed3a77a22a337e2af398
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson  setup ..            \
	       --prefix=/usr       \
	       --buildtype=release \
	       -Dgst_debug=false   \
	       -Dpackage-origin=https://www.linuxfromscratch.org/blfs/view/12.0-systemd/ \
	       -Dpackage-name="GStreamer 1.22.5 BLFS" &&
	ninja
    ninja install
}

