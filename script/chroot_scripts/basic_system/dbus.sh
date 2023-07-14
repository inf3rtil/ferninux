#!/bin/bash

SRC_COMPRESSED_FILE=dbus-1.14.6.tar.xz
SRC_FOLDER=dbus-1.14.6

build_source_package(){
    ./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--runstatedir=/run \
		--disable-static \
		--disable-doxygen-docs \
		--disable-xml-docs \
		--docdir=/usr/share/doc/dbus-1.14.6 \
		--with-system-socket=/run/dbus/system_bus_socket
    make $MAKEFLAGS
    make install
    ln -sfv /etc/machine-id /var/lib/dbus
}

