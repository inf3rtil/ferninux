#!/bin/bash

PACKAGE_NAME=docbook-xsl-nons
VERSION=1.79.2
DOWNLOAD_URL=https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-nons-1.79.2.tar.bz2
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/docbook-xsl-nons-1.79.2-stack_fix-1.patch
MD5_SUM=2666d1488d6ced1551d15f31d7ed8c38
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    patch -Np1 -i ../docbook-xsl-nons-1.79.2-stack_fix-1.patch
    install -v -m755 -d /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 &&

	cp -v -R VERSION assembly common eclipse epub epub3 extensions fo        \
           highlighting html htmlhelp images javahelp lib manpages params  \
           profiling roundtrip slides template tests tools webhelp website \
           xhtml xhtml-1_1 xhtml5                                          \
	   /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 &&

	ln -s VERSION /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2/VERSION.xsl &&

	install -v -m644 -D README \
                /usr/share/doc/docbook-xsl-nons-1.79.2/README.txt &&
	install -v -m644    RELEASE-NOTES* NEWS* \
                /usr/share/doc/docbook-xsl-nons-1.79.2
}

