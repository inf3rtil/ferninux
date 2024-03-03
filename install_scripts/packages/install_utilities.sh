#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(utilities/which)
recipes+=(xml/docbook-xml) 
recipes+=(xml/docbook-xsl-nons) 
recipes+=(xml/xmlto)
recipes+=(printing/cups)
recipes+=(utilities/cpio)
recipes+=(utilities/shared-mime-info)

install_package_list
