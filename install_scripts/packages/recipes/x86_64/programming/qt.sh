#!/bin/bash

PACKAGE_NAME="qt-everywhere-src"
VERSION="5.15.10" 
DOWNLOAD_URL=https://download.qt.io/archive/qt/5.15/5.15.10/single/qt-everywhere-opensource-src-5.15.10.tar.xz
DOWNLOAD_URL_1=https://www.linuxfromscratch.org/patches/blfs/12.0/qt-everywhere-opensource-src-5.15.10-kf5-1.patch
MD5_SUM=fb41d86bea6bc4886030a5092c910b09
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){

    export QT5PREFIX=/opt/qt5
    patch -Np1 -i ../qt-everywhere-opensource-src-5.15.10-kf5-1.patch
    mkdir -pv qtbase/.git
    sed -e "/pragma once/a#include <cstdint>"                                      \
	-i qtlocation/src/3rdparty/mapbox-gl-native/include/mbgl/util/geometry.hpp \
	qtlocation/src/3rdparty/mapbox-gl-native/include/mbgl/util/string.hpp   \
	qtlocation/src/3rdparty/mapbox-gl-native/src/mbgl/gl/stencil_mode.hpp
    ./configure -prefix $QT5PREFIX                        \
            -sysconfdir /etc/xdg                      \
            -confirm-license                          \
            -opensource                               \
            -dbus-linked                              \
            -openssl-linked                           \
            -system-harfbuzz                          \
            -system-sqlite                            \
            -nomake examples                          \
            -no-rpath                                 \
            -journald                                 \
            -skip qtwebengine                         &&
	make $MAKEFLAGS
    make install
    find $QT5PREFIX/ -name \*.prl \
	 -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    QT5BINDIR=$QT5PREFIX/bin

install -v -dm755 /usr/share/pixmaps/                  &&

install -v -Dm644 qttools/src/assistant/assistant/images/assistant-128.png \
                  /usr/share/pixmaps/assistant-qt5.png &&

install -v -Dm644 qttools/src/designer/src/designer/images/designer.png \
                  /usr/share/pixmaps/designer-qt5.png  &&

install -v -Dm644 qttools/src/linguist/linguist/images/icons/linguist-128-32.png \
                  /usr/share/pixmaps/linguist-qt5.png  &&

install -v -Dm644 qttools/src/qdbus/qdbusviewer/images/qdbusviewer-128.png \
                  /usr/share/pixmaps/qdbusviewer-qt5.png &&

install -dm755 /usr/share/applications &&

cat > /usr/share/applications/assistant-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 Assistant
Comment=Shows Qt5 documentation and examples
Exec=$QT5BINDIR/assistant
Icon=assistant-qt5.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Documentation;
EOF

cat > /usr/share/applications/designer-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 Designer
GenericName=Interface Designer
Comment=Design GUIs for Qt5 applications
Exec=$QT5BINDIR/designer
Icon=designer-qt5.png
MimeType=application/x-designer;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > /usr/share/applications/linguist-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 Linguist
Comment=Add translations to Qt5 applications
Exec=$QT5BINDIR/linguist
Icon=linguist-qt5.png
MimeType=text/vnd.trolltech.linguist;application/x-linguist;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > /usr/share/applications/qdbusviewer-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 QDbusViewer
GenericName=D-Bus Debugger
Comment=Debug D-Bus applications
Exec=$QT5BINDIR/qdbusviewer
Icon=qdbusviewer-qt5.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Debugger;
EOF

for file_qt in moc uic rcc qmake lconvert lrelease lupdate; do
  ln -sfrvn $QT5BINDIR/$file_qt /usr/bin/$file_qt-qt5
done

mkdir -pv /opt/qt-5.15.10
ln -sfnv qt-5.15.10 /opt/qt5

cat >> /etc/ld.so.conf << EOF
# Begin Qt addition

/opt/qt5/lib

# End Qt addition
EOF

ldconfig

cat > /etc/profile.d/qt5.sh << "EOF"
# Begin /etc/profile.d/qt5.sh

QT5DIR=/opt/qt5

pathappend $QT5DIR/bin           PATH
pathappend $QT5DIR/lib/pkgconfig PKG_CONFIG_PATH

export QT5DIR

# End /etc/profile.d/qt5.sh
EOF

}

