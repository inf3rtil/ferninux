#!/bin/bash

PACKAGE_NAME=cpio
VERSION=2.14
DOWNLOAD_URL=https://ftp.gnu.org/gnu/cpio/cpio-2.14.tar.bz2
MD5_SUM=b153e1843561841d37190e48b891188d
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr \
            --enable-mt   \
            --with-rmt=/usr/libexec/rmt &&
	make $MAKEFLAGS &&
	makeinfo --html            -o doc/html      doc/cpio.texi &&
	makeinfo --html --no-split -o doc/cpio.html doc/cpio.texi &&
	makeinfo --plaintext       -o doc/cpio.txt  doc/cpio.texi
    make install &&
	install -v -m755 -d /usr/share/doc/cpio-2.14/html &&
	install -v -m644    doc/html/* /usr/share/doc/cpio-2.14/html &&
	install -v -m644    doc/cpio.{html,txt} /usr/share/doc/cpio-2.14
}

