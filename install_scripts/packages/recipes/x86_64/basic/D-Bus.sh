#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg].sh

# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

# package details
MD5_SUM="46070a3487817ff690981f8cd2ba9376"
DOWNLOAD_URLS[$MD5_SUM]="https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr                        \
		--sysconfdir=/etc                    \
		--localstatedir=/var                 \
		--runstatedir=/run                   \
		--enable-user-session                \
		--disable-static                     \
		--disable-doxygen-docs               \
		--disable-xml-docs                   \
		--docdir=/usr/share/doc/dbus-1.14.10 \
		--with-system-socket=/run/dbus/system_bus_socket
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    ln -sfv /etc/machine-id /var/lib/dbus
}
