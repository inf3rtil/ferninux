#!/bin/bash

PACKAGE_NAME=sgml-common
VERSION=0.6.3
DOWNLOAD_URL=https://sourceware.org/ftp/docbook-tools/new-trials/SOURCES/sgml-common-0.6.3.tgz
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/sgml-common-0.6.3-manpage-1.patch
MD5_SUM=103c9828f24820df86e55e7862e28974
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../sgml-common-0.6.3-manpage-1.patch &&
	autoreconf -f -i
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make docdir=/usr/share/doc install &&

	install-catalog --add /etc/sgml/sgml-ent.cat \
			/usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&
	
	install-catalog --add /etc/sgml/sgml-docbook.cat \
			/etc/sgml/sgml-ent.cat
}

