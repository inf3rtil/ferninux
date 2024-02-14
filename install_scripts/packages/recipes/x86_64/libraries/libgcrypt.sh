#!/bin/bash

PACKAGE_NAME=libgcrypt
VERSION=1.10.2
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.2.tar.bz2
MD5_SUM=663abb395452750522d6797967e2f442
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make                      &&
	
	make -C doc html                                                       &&
	makeinfo --html --no-split -o doc/gcrypt_nochunks.html doc/gcrypt.texi &&
	makeinfo --plaintext       -o doc/gcrypt.txt           doc/gcrypt.texi
    make install &&
	install -v -dm755   /usr/share/doc/libgcrypt-1.10.2 &&
	install -v -m644    README doc/{README.apichanges,fips*,libgcrypt*} \
                /usr/share/doc/libgcrypt-1.10.2 &&
	install -v -dm755   /usr/share/doc/libgcrypt-1.10.2/html &&
	install -v -m644 doc/gcrypt.html/* \
                /usr/share/doc/libgcrypt-1.10.2/html &&
	install -v -m644 doc/gcrypt_nochunks.html \
                    /usr/share/doc/libgcrypt-1.10.2      &&
	install -v -m644 doc/gcrypt.{txt,texi} \
                /usr/share/doc/libgcrypt-1.10.2
}

