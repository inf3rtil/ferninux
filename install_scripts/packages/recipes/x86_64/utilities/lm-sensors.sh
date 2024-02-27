#!/bin/bash

PACKAGE_NAME=lm-sensors
VERSION=3-6-0
DOWNLOAD_URL=https://github.com/lm-sensors/lm-sensors/archive/V3-6-0/lm-sensors-3-6-0.tar.gz
MD5_SUM=f60e47b5eb50bbeed48a9f43bb08dd5e
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    make $MAKEFLAGS PREFIX=/usr        \
     BUILD_STATIC_LIB=0 \
     MANDIR=/usr/share/man
    make PREFIX=/usr        \
     BUILD_STATIC_LIB=0 \
     MANDIR=/usr/share/man install &&

	install -v -m755 -d /usr/share/doc/lm_sensors-3-6-0 &&
	cp -rv              README INSTALL doc/* \
                    /usr/share/doc/lm_sensors-3-6-0
}

