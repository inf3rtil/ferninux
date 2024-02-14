#!/bin/bash

PACKAGE_NAME=Linux-PAM
VERSION=1.5.3
DOWNLOAD_URL=https://github.com/linux-pam/linux-pam/releases/download/v1.5.3/Linux-PAM-1.5.3.tar.xz
MD5_SUM=a913bd5fbf9edeafaacf3eb1eb86fd83
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                        \
            --sbindir=/usr/sbin                  \
            --sysconfdir=/etc                    \
            --libdir=/usr/lib                    \
            --enable-securedir=/usr/lib/security \
            --docdir=/usr/share/doc/Linux-PAM-1.5.3 &&
	make $MAKEFLAGS
    install -v -m755 -d /etc/pam.d &&

cat > /etc/pam.d/other << "EOF"
auth     required       pam_deny.so
account  required       pam_deny.so
password required       pam_deny.so
session  required       pam_deny.so
EOF
    rm -fv /etc/pam.d/other
    make install &&
	chmod -v 4755 /usr/sbin/unix_chkpwd
}
