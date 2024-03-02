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
recipes+=(libraries/libgudev)
recipes+=(utilities/modemmanager)
recipes+=(kde/extra-cmake-modules)
recipes+=(kde/phonon)
recipes+=(utilities/cdparanoia-III)
recipes+=(multimedia_libraries/gstreamer)
recipes+=(multimedia/gst-plugins-base)
recipes+=(multimedia/gst-plugins-good)
recipes+=(kde/phonon-backend-gstreamer)
recipes+=(kde/polkit-qt)
recipes+=(kde/libdbusmenu-qt)
recipes+=(kde/plasma-wayland-protocols)
recipes+=(kde/kuserfeedback)
recipes+=(utilities/sgml-common)
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
#network manager
recipes+=(libraries/jansson)
recipes+=(network_libraries/libndp)
recipes+=(network/dhcpcd)
recipes+=(network/networkmanager)
#python modules for kapidox
recipes+=(programming/cython)
recipes+=(libraries/libyaml)
recipes+=(programming/pyyaml)
recipes+=(programming/uri)
recipes+=(programming/chardet)
recipes+=(programming/doxypypy)
recipes+=(programming/doxyqml)
recipes+=(programming/charset-normalizer)
recipes+=(programming/idna)
recipes+=(programming/packaging)
recipes+=(programming/typing_extensions)
recipes+=(programming/setuptools_scm)
recipes+=(programming/pluggy)
recipes+=(programming/pathspec)
recipes+=(programming/editables)
recipes+=(programming/hatchling)
recipes+=(programming/urllib3)
recipes+=(programming/requests)
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
recipes+=(kde/kdesignerplugin) # deprecated Qt6
recipes+=(kde/kwayland)
recipes+=(kde/plasma-framework)
recipes+=(kde/modemmanager-qt) 
recipes+=(kde/kpeople)
recipes+=(kde/kxmlrpcclient) #deprecated Qt6
recipes+=(kde/bluez-qt)
recipes+=(kde/kfilemetadata)
recipes+=(kde/baloo)
recipes+=(kde/kactivities-stats)
recipes+=(kde/krunner)
recipes+=(kde/prison)
recipes+=(kde/qqc2-desktop-style)
recipes+=(kde/kjs) # deprecated
recipes+=(kde/kdelibs4support)
recipes+=(kde/khtml) # deprecated
recipes+=(kde/kjsembed) # deprecated
recipes+=(kde/kmediaplayer) # deprecated
recipes+=(kde/kross) # deprecated
recipes+=(kde/kholidays)
recipes+=(kde/purpose)
recipes+=(kde/kcalendarcore)
recipes+=(kde/kcontacts)
recipes+=(kde/kquickcharts)
recipes+=(kde/knotifyconfig)
recipes+=(kde/kdav)
#end autogen

install_package_list
