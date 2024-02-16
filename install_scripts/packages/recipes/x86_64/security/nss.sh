#!/bin/bash

PACKAGE_NAME=nss
VERSION=3.92
DOWNLOAD_URL=https://archive.mozilla.org/pub/security/nss/releases/NSS_3_92_RTM/src/nss-3.92.tar.gz
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/nss-3.92-standalone-1.patch
MD5_SUM=589167c3be81d09b9e332ff17d46ebca
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../nss-3.92-standalone-1.patch &&

	cd nss &&

	make BUILD_OPT=1                  \
	     NSPR_INCLUDE_DIR=/usr/include/nspr  \
	     USE_SYSTEM_ZLIB=1                   \
	     ZLIB_LIBS=-lz                       \
	     NSS_ENABLE_WERROR=0                 \
	     $([ $(uname -m) = x86_64 ] && echo USE_64=1) \
	     $([ -f /usr/include/sqlite3.h ] && echo NSS_USE_SYSTEM_SQLITE=1)
    

    cd ../dist                                                          &&

	install -v -m755 Linux*/lib/*.so              /usr/lib              &&
	install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib              &&

	install -v -m755 -d                           /usr/include/nss      &&
	cp -v -RL {public,private}/nss/*              /usr/include/nss      &&

	install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin &&

	install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig
    ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
}

