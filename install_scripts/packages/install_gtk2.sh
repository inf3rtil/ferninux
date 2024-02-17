#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(utilities/dbus)
recipes+=(gnome/gsettings-desktop-schemas)
recipes+=(graphical_libraries/at-spi2-core)
recipes+=(graphical_libraries/gdk-pixbuf)
recipes+=(graphical_libraries/fribidi)
recipes+=(graphical_libraries/cairo)
recipes+=(graphical_libraries/pango)

install_package_list
