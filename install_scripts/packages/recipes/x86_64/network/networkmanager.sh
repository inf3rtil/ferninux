#!/bin/bash

PACKAGE_NAME=NetworkManager
VERSION=1.44.0
DOWNLOAD_URL=https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.0.tar.xz
MD5_SUM=2a39852cda0f04bd72c9782839b1dc7d
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    grep -rl '^#!.*python$' | xargs sed -i '1s/python/&3/'
    mkdir build &&
	cd    build    &&

	CXXFLAGS+="-O2 -fPIC"            \
		 meson setup ..                   \
		 --prefix=/usr              \
		 --buildtype=release        \
		 -Dlibaudit=no              \
		 -Dlibpsl=false             \
		 -Dnmtui=false               \
		 -Dovs=false                \
		 -Dppp=false                \
		 -Dselinux=false            \
		 -Dqt=false                 \
		 -Dsession_tracking=systemd \
		 -Dmodem_manager=false      &&
	ninja
    ninja install &&
	mv -v /usr/share/doc/NetworkManager{,-1.44.0}
}

