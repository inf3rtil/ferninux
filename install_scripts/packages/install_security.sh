#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(security/libtasn1)
recipes+=(security/p11-kit)
recipes+=(security/make-ca)
recipes+=(security/linux-pam)
recipes+=(security/shadow)
recipes+=(utilities/systemd)
recipes+=(libraries/duktape)
recipes+=(network_libraries/curl)
recipes+=(programming/cmake)
recipes+=(security/polkit)
recipes+=(security/iptables)
recipes+=(libraries/nspr)
recipes+=(security/nss)

install_package_list


