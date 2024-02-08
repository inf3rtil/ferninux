#!/bin/bash

PACKAGE_NAME=Xorg-Server
VERSION=21.1.8 
DOWNLOAD_URL=https://www.x.org/pub/individual/xserver/xorg-server-21.1.8.tar.xz
DOWNLOAD_URL_2=https://www.linuxfromscratch.org/patches/blfs/12.0/xorg-server-21.1.8-tearfree_backport-1.patch
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../xorg-server-21.1.8-tearfree_backport-1.patch
    mkdir build &&
	cd    build &&
	
	meson setup ..              \
	      --prefix=$XORG_PREFIX \
	      --localstatedir=/var  \
	      -Dglamor=true         \
	      -Dxkb_output_dir=/var/lib/xkb &&
	ninja
    ninja install &&
	mkdir -pv /etc/X11/xorg.conf.d
}

