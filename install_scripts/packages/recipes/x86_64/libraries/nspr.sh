#!/bin/bash

PACKAGE_NAME=nspr
VERSION=4.35
DOWNLOAD_URL=https://archive.mozilla.org/pub/nspr/releases/v4.35/src/nspr-4.35.tar.gz
MD5_SUM=5e0acf9fbdde85181bddd510f4624841
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    cd nspr                                                     &&
	sed -ri '/^RELEASE/s/^/#/' pr/src/misc/Makefile.in &&
	sed -i 's#$(LIBRARY) ##'   config/rules.mk         &&
	
	./configure --prefix=/usr \
		    --with-mozilla \
		    --with-pthreads \
		    $([ $(uname -m) = x86_64 ] && echo --enable-64bit) &&
	make $MAKEFLAGS
    make install
}

