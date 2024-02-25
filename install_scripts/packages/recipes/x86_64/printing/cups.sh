#!/bin/bash

PACKAGE_NAME=cups
VERSION=2.4.6
DOWNLOAD_URL=https://github.com/OpenPrinting/cups/releases/download/v2.4.6/cups-2.4.6-source.tar.gz
MD5_SUM=b8ca6027eaeeed6171178cc526879ff5
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp
    groupadd -g 19 lpadmin
    ./configure --libdir=/usr/lib            \
            --with-rundir=/run/cups      \
            --with-system-groups=lpadmin \
            --with-docdir=/usr/share/cups/doc-2.4.6 &&
	make $MAKEFLAGS
    make install &&
	ln -svnf ../cups/doc-2.4.6 /usr/share/doc/cups-2.4.6
    echo "ServerName /run/cups/cups.sock" > /etc/cups/client.conf
}

