#!/bin/bash

PACKAGE_NAME=Xwayland
VERSION=23.2.0
DOWNLOAD_URL=https://www.x.org/pub/individual/xserver/xwayland-23.2.0.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i '/install_man/,$d' meson.build &&

	mkdir build &&
	cd    build &&
	
	meson setup --prefix=$XORG_PREFIX         \
              --buildtype=release           \
              -Dxkb_output_dir=/var/lib/xkb \
              ..                            &&
	ninja
    ninja install
}

