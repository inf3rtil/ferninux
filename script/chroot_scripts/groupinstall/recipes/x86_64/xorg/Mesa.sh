#!/bin/bash

PACKAGE_NAME=Mesa
VERSION=23.1.6
DOWNLOAD_URL=https://mesa.freedesktop.org/archive/mesa-23.1.6.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup                   \
	      --prefix=$XORG_PREFIX   \
	      --buildtype=release     \
	      -Dplatforms=x11,wayland \
	      -Dgallium-drivers=auto  \
	      -Dvulkan-drivers=""     \
	      -Dvalgrind=disabled     \
	      -Dlibunwind=disabled    \
	      ..                      &&
	
	ninja
    ninja_install
    install -v -dm755 /usr/share/doc/mesa-$VERSION &&
	cp -rfv ../docs/* /usr/share/doc/mesa-$VERSION
}

