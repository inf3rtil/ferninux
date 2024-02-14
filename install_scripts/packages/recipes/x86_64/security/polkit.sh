#!/bin/bash

PACKAGE_NAME=polkit
VERSION=123
DOWNLOAD_URL=https://gitlab.freedesktop.org/polkit/polkit/-/archive/123/polkit-123.tar.gz
MD5_SUM=36540b837c588e1e77145523bb39f511
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    groupadd -fg 27 polkitd &&
	useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
		-g polkitd -s /bin/false polkitd || echo "User already exists."
    sed -e 's/JS_Init/JS::DisableJitBackend(); &/' \
	-i src/polkitbackend/polkitbackendjsauthority.cpp
    mkdir build &&
	cd    build &&

	meson setup ..                            \
	      --prefix=/usr                       \
	      --buildtype=release                 \
	      -Dman=false                          \
	      -Dsession_tracking=libsystemd-login \
	      -Dtests=false                        &&
	ninja
    ninja install
}

