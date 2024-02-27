#!/bin/bash

PACKAGE_NAME=gtk+
VERSION=3.24.38
DOWNLOAD_URL=https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.38.tar.xz
MD5_SUM=7ed2f5914683ebd515da22f5784389f4
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&
	meson setup --prefix=/usr           \
              --buildtype=release     \
              -Dman=false              \
              -Dbroadway_backend=true \
              ..                      &&
	ninja
    ninja install
    mkdir -vp ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini << "EOF"
[Settings]
gtk-theme-name = Adwaita
gtk-icon-theme-name = oxygen
gtk-font-name = DejaVu Sans 12
gtk-cursor-theme-size = 18
gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
gtk-xft-antialias = 1
gtk-xft-hinting = 1
gtk-xft-hintstyle = hintslight
gtk-xft-rgba = rgb
gtk-cursor-theme-name = Adwaita
EOF
}

