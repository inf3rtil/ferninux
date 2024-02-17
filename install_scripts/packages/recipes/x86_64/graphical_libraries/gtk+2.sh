#!/bin/bash

PACKAGE_NAME="gtk+"
VERSION=2.24.33
DOWNLOAD_URL=https://download.gnome.org/sources/gtk+/2.24/gtk+-2.24.33.tar.xz
MD5_SUM=0118e98dbe0e4dab90ce475f9f0e6c0c
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -e 's#l \(gtk-.*\).sgml#& -o \1#' \
    -i docs/{faq,tutorial}/Makefile.in      &&

	./configure --prefix=/usr --sysconfdir=/etc &&

	make $MAKEFLAGS
    make install
    cat > /etc/gtk-2.0/gtkrc << "EOF"
include "/usr/share/themes/Clearlooks/gtk-2.0/gtkrc"
gtk-icon-theme-name = "elementary"
EOF
}

