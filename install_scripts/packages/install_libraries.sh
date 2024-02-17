#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(libraries/pcre2)
recipes+=(libraries/libxml2)
recipes+=(libraries/libxslt)
recipes+=(libraries/glib)
recipes+=(libraries/libarchive)
recipes+=(libraries/libuv)
recipes+=(libraries/gobject-introspection)
recipes+=(network_libraries/curl)
#recipes+=(libraries/icu)
#recipes+=(libraries/libqalculate)

install_package_list
