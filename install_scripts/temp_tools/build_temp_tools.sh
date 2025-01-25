#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare recipes=()
recipes+=(essential-files)
recipes+=(gettext)
recipes+=(bison)
recipes+=(perl)
recipes+=(python)
recipes+=(texinfo)
recipes+=(util-linux)

install_package_list

#TODO cleaning up only when full image is done
#echo "cleaning up"
#rm -rf /usr/share/{info,man,doc}/*
#find /usr/{lib,libexec} -name \*.la -delete
#rm -rf /tools
