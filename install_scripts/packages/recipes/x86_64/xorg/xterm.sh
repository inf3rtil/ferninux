#!/bin/bash

PACKAGE_NAME=xterm
VERSION=384
DOWNLOAD_URL=https://invisible-mirror.net/archives/xterm/xterm-384.tgz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap &&
	printf '\tkbs=\\177,\n' >> terminfo &&

	TERMINFO=/usr/share/terminfo \
	    ./configure $XORG_CONFIG     \
	    --with-app-defaults=/etc/X11/app-defaults &&
	
	make $MAKEFLAGS
    make install    &&
	make install-ti &&
	mkdir -pv /usr/share/applications &&
	cp -v *.desktop /usr/share/applications/

    cat >> /etc/X11/app-defaults/XTerm << "EOF"
*VT100*locale: true
*VT100*faceName: Monospace
*VT100*faceSize: 10
*backarrowKeyIsErase: true
*ptyInitialErase: true
EOF
}

