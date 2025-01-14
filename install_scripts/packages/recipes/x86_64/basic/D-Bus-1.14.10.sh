#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
PACKAGE_NAME=dbus
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="46070a3487817ff690981f8cd2ba9376"
DOWNLOAD_URLS[$MD5_SUM]="https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

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
