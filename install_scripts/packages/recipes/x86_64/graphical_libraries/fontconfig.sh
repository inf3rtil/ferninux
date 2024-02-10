#!/bin/bash

PACKAGE_NAME=fontconfig
VERSION=2.14.2
DOWNLOAD_URL=https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.14.2.tar.xz
MD5_SUM=95261910ea727b5dd116b06fbfd84b1f
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--disable-docs       \
		--docdir=/usr/share/doc/fontconfig-2.14.2 &&
	make $MAKEFLAGS
    make install
    
    install -v -dm755 \
            /usr/share/{man/man{1,3,5},doc/fontconfig-2.14.2/fontconfig-devel} &&
	install -v -m644 fc-*/*.1         /usr/share/man/man1 &&
	install -v -m644 doc/*.3          /usr/share/man/man3 &&
	install -v -m644 doc/fonts-conf.5 /usr/share/man/man5 &&
	install -v -m644 doc/fontconfig-devel/* \
                /usr/share/doc/fontconfig-2.14.2/fontconfig-devel &&
	install -v -m644 doc/*.{pdf,sgml,txt,html} \
                /usr/share/doc/fontconfig-2.14.2
}

