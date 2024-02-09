#!/bin/bash

SRC_COMPRESSED_FILE=dbus-1.14.8.tar.xz
SRC_FOLDER=dbus-1.14.8

build_source_package(){
    ./configure --prefix=/usr                        \
		--sysconfdir=/etc                    \
		--localstatedir=/var                 \
		--runstatedir=/run                   \
		--enable-user-session                \
		--disable-static                     \
		--disable-doxygen-docs               \
		--disable-xml-docs                   \
		--docdir=/usr/share/doc/dbus-1.14.8  \
		--with-system-socket=/run/dbus/system_bus_socket
    make $MAKEFLAGS
    make install
    ln -sfv /etc/machine-id /var/lib/dbus
}

