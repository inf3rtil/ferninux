#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(xfce/libxfce4util)
recipes+=(xfce/xfconf)
recipes+=(xfce/libxfce4ui)
recipes+=(xfce/exo)
recipes+=(xfce/garcon)
recipes+=(gnome/libwnck)
recipes+=(xfce/xfce4-panel) 
recipes+=(xfce/thunar)
recipes+=(xfce/thunar-volman)
recipes+=(xfce/tumbler)
recipes+=(xfce/xfce4-appfinder)
recipes+=(graphical_libraries/libnotify)
recipes+=(libraries/libgudev)
recipes+=(libraries/libusb)
recipes+=(utilities/upower)
recipes+=(xfce/xfce4-power-manager)
recipes+=(icons/hicolor-icon-theme)
recipes+=(programming/xml-simple)
recipes+=(icons/icon-naming-utils)
recipes+=(icons/gnome-icon-theme)
recipes+=(multimedia_libraries/libcanberra)
recipes+=(xfce/xfce4-settings)
recipes+=(xfce/xfdesktop)
recipes+=(xfce/xfwm4)
recipes+=(xfce/xfce4-session) 

install_package_list
