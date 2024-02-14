#!/bin/bash

PACKAGE_NAME=gst-plugins-base
VERSION=1.22.5
DOWNLOAD_URL=https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.5.tar.xz
MD5_SUM=cc16aeaefdfd3917e009412a22d07fac
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson  setup ..               \
	       --prefix=/usr          \
	       --buildtype=release    \
	       --wrap-mode=nodownload \
	       -Dpackage-origin=https://www.linuxfromscratch.org/blfs/view/12.0-systemd/ \
	       -Dpackage-name="GStreamer 1.22.5 BLFS"    &&
	ninja
    ninja install
}

