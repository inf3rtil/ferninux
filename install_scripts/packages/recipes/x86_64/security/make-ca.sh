#!/bin/bash

PACKAGE_NAME=make-ca
VERSION=1.12
DOWNLOAD_URL=https://github.com/lfs-book/make-ca/releases/download/v1.12/make-ca-1.12.tar.xz
MD5_SUM=67e0b911e73a859fc326171c5153d455
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    make install &&
	install -vdm755 /etc/ssl/local
    #/usr/sbin/make-ca -g
    systemctl enable update-pki.timer
}

