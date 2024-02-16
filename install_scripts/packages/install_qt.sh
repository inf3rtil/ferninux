#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(multimedia_libraries/alsa-lib)
recipes+=(graphical_libraries/harfbuzz)
recipes+=(databases/sqlite)
recipes+=(libraries/libxkbcommon)
recipes+=(programming/qt)

install_package_list
