#!/bin/bash

PACKAGE_NAME=cairo
VERSION=1.17.6
DOWNLOAD_URL=https://download.gnome.org/sources/cairo/1.17/cairo-1.17.6.tar.xz
MD5_SUM=c5a6f255af72a2e5faa8e6a53dd882e2
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed 's/PTR/void */' -i util/cairo-trace/lookup-symbol.c
    sed -e "/@prefix@/a exec_prefix=@exec_prefix@" \
	-i util/cairo-script/cairo-script-interpreter.pc.in
    ./configure --prefix=/usr    \
            --disable-static \
            --enable-tee &&
	make $MAKEFLAGS
    make install
}

