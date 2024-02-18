#!/bin/bash

PACKAGE_NAME=cracklib
VERSION=2.9.11
DOWNLOAD_URL=https://github.com/cracklib/cracklib/releases/download/v2.9.11/cracklib-2.9.11.tar.xz
DOWNLOAD_URL_1=https://github.com/cracklib/cracklib/releases/download/v2.9.11/cracklib-words-2.9.11.xz
MD5_SUM=a6dfb1766aab43a54e1cbd78abf0a20a
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    autoreconf -fiv &&

	PYTHON=python3               \
	    ./configure --prefix=/usr    \
            --disable-static \
            --with-default-dict=/usr/lib/cracklib/pw_dict &&
	make $MAKEFLAGS
    make install

    install -v -m644 -D    ../cracklib-words-2.9.11.xz \
                         /usr/share/dict/cracklib-words.xz    &&

	unxz -v                  /usr/share/dict/cracklib-words.xz    &&
	ln -v -sf cracklib-words /usr/share/dict/words                &&
	echo $(hostname) >>      /usr/share/dict/cracklib-extra-words &&
	install -v -m755 -d      /usr/lib/cracklib                    &&
	
	create-cracklib-dict     /usr/share/dict/cracklib-words \
				 /usr/share/dict/cracklib-extra-words
}

