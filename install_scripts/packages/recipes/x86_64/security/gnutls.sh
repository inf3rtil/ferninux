#!/bin/bash

PACKAGE_NAME=gnutls
VERSION=3.8.1
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.1.tar.xz
MD5_SUM=31a4b85586522c527b044597e86870a4
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr \
            --docdir=/usr/share/doc/gnutls-3.8.1 \
            --with-default-trust-store-pkcs11="pkcs11:" &&
	make $MAKEFLAGS
    make install
}

