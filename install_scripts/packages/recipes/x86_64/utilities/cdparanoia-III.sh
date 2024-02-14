#!/bin/bash

PACKAGE_NAME=cdparanoia-III
VERSION=10.2
DOWNLOAD_URL=https://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-10.2.src.tgz
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/cdparanoia-III-10.2-gcc_fixes-1.patch
MD5_SUM=b304bbe8ab63373924a744eac9ebc652
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../cdparanoia-III-10.2-gcc_fixes-1.patch &&
	./configure --prefix=/usr --mandir=/usr/share/man &&
	make -j1
    make install &&
	chmod -v 755 /usr/lib/libcdda_*.so.0.10.2 &&
	rm -fv /usr/lib/libcdda_*.a
}

