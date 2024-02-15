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
recipes+=(utilities/systemd)
recipes+=(security/shadow)
recipes+=(libraries/duktape)
recipes+=(security/polkit)
recipes+=(security/iptables)


install_package_list
