#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

export KF5_PREFIX=/usr

cat >> /etc/profile.d/qt5.sh << "EOF"
# Begin kf5 extension for /etc/profile.d/qt5.sh

pathappend /usr/lib/plugins        QT_PLUGIN_PATH
pathappend $QT5DIR/lib/plugins     QT_PLUGIN_PATH

pathappend /usr/lib/qt5/qml        QML2_IMPORT_PATH
pathappend $QT5DIR/lib/qml         QML2_IMPORT_PATH

# End extension for /etc/profile.d/qt5.sh
EOF

cat > /etc/profile.d/kf5.sh << "EOF"
# Begin /etc/profile.d/kf5.sh

export KF5_PREFIX=/usr

# End /etc/profile.d/kf5.sh
EOF

declare -a recipes=()
recipes+=(libraries/gobject-introspection)
recipes+=(multimedia_libraries/alsa-lib)
recipes+=(utilities/which)
recipes+=(graphical_libraries/harfbuzz)
recipes+=(databases/sqlite)
recipes+=(libraries/libxkbcommon)
recipes+=(programming/qt)
recipes+=(kde/extra-cmake-modules)
recipes+=(kde/phonon)
recipes+=(utilities/cdparanoia-III)
recipes+=(multimedia_libraries/gstreamer)
recipes+=(multimedia/gst-plugins-base)
recipes+=(multimedia/gst-plugins-good)
recipes+=(kde/phonon-backend-gstreamer) #ok
recipes+=(kde/polkit-qt)
recipes+=(kde/libdbusmenu-qt)
recipes+=(kde/plasma-wayland-protocols)
recipes+=(kde/kuserfeedback)
recipes+=(libraries/boost)
recipes+=(utilities/sgml-common)
recipes+=(xml/docbook-xml) #refactor
recipes+=(xml/docbook-xsl-nons) #refactor
recipes+=(xml/xmlto)
recipes+=(graphical_libraries/giflib)
recipes+=(graphical_libraries/libepoxy)
recipes+=(libraries/libgpg-error)
recipes+=(libraries/libgcrypt)
recipes+=(programming/vala)
recipes+=(libraries/libical)
recipes+=(graphical_libraries/libjpeg-turbo)
recipes+=(graphical_libraries/libpng)
recipes+=(libraries/libxslt)
recipes+=(databases/lmdb)
recipes+=(libraries/qca)
recipes+=(graphical_libraries/qrencode)
recipes+=(utilities/shared-mime-info)
recipes+=(programming/uri)
#auto generated (kf5)
recipes+=(kde/attica)
recipes+=(kde/kapidox)
recipes+=(kde/karchive)
recipes+=(kde/kcodecs)
recipes+=(kde/kconfig)
recipes+=(kde/kcoreaddons)
recipes+=(kde/kdbusaddons)
recipes+=(kde/kdnssd)
recipes+=(kde/kguiaddons)
recipes+=(kde/ki18n)
recipes+=(kde/kidletime)
recipes+=(kde/kimageformats)
recipes+=(kde/kitemmodels)
recipes+=(kde/kitemviews)
recipes+=(kde/kplotting)
recipes+=(kde/kwidgetsaddons)
recipes+=(kde/kwindowsystem)
recipes+=(kde/networkmanager-qt)
recipes+=(kde/solid)
recipes+=(kde/sonnet)
recipes+=(kde/threadweaver)
recipes+=(kde/kauth)
recipes+=(kde/kcompletion)
recipes+=(kde/kcrash)
recipes+=(kde/kdoctools)
recipes+=(kde/kpty)
recipes+=(kde/kunitconversion)
recipes+=(kde/kconfigwidgets)
recipes+=(kde/kservice)
recipes+=(kde/kglobalaccel)
recipes+=(kde/kpackage)
recipes+=(kde/kdesu)
recipes+=(kde/kemoticons)
recipes+=(kde/kiconthemes)
recipes+=(kde/kjobwidgets)
recipes+=(kde/knotifications)
recipes+=(kde/ktextwidgets)
recipes+=(kde/kxmlgui)
recipes+=(kde/kbookmarks)
recipes+=(kde/kwallet)
recipes+=(kde/kded)
recipes+=(kde/kio)
recipes+=(kde/kdeclarative)
recipes+=(kde/kcmutils)
recipes+=(kde/kirigami2)
recipes+=(kde/syndication)
recipes+=(kde/knewstuff)
recipes+=(kde/frameworkintegration)
recipes+=(kde/kinit)
recipes+=(kde/kparts)
recipes+=(kde/kactivities)
recipes+=(kde/syntax-highlighting)
recipes+=(kde/ktexteditor)
recipes+=(kde/kdesignerplugin)
recipes+=(kde/kwayland)
recipes+=(kde/plasma-framework)
recipes+=(kde/modemmanager-qt)
recipes+=(kde/kpeople)
recipes+=(kde/kxmlrpcclient)
recipes+=(kde/bluez-qt)
recipes+=(kde/kfilemetadata)
recipes+=(kde/baloo)
recipes+=(kde/kactivities-stats)
recipes+=(kde/krunner)
recipes+=(kde/prison)
recipes+=(kde/qqc2-desktop-style)
recipes+=(kde/kjs)
recipes+=(kde/kdelibs4support)
recipes+=(kde/khtml)
recipes+=(kde/kjsembed)
recipes+=(kde/kmediaplayer)
recipes+=(kde/kross)
recipes+=(kde/kholidays)
recipes+=(kde/purpose)
recipes+=(kde/kcalendarcore)
recipes+=(kde/kcontacts)
recipes+=(kde/kquickcharts)
recipes+=(kde/knotifyconfig)
recipes+=(kde/kdav)
#end autogen

install_package_list
