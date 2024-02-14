#!/bin/bash

PACKAGE_NAME=gst-plugins-good
VERSION=1.22.5
DOWNLOAD_URL=https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.5.tar.xz
MD5_SUM=8c5a67f702ff5f30290be35ac27b3ac9
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup ..            \
	      --prefix=/usr       \
	      --buildtype=release \
	      -Dpackage-origin=https://www.linuxfromscratch.org/blfs/view/12.0-systemd/ \
	      -Dpackage-name="GStreamer 1.22.5 BLFS" &&
	ninja
    ninja install
}

