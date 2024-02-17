#!/bin/bash

PACKAGE_NAME=dbus
VERSION=1.14.8
DOWNLOAD_URL=https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz
MD5_SUM=da42f55aeec51b355587bc3062fc2d41
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --runstatedir=/run                   \
            --enable-user-session                \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --disable-static                     \
            --docdir=/usr/share/doc/dbus-1.14.8  \
            --with-system-socket=/run/dbus/system_bus_socket &&
	make $MAKEFLAGS
    make install
}

