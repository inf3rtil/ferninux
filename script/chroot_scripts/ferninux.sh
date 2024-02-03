#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

#$SCRIPT_PATH/create_essential_files.sh #chapter 7 
#$SCRIPT_PATH/build_temp_tools.sh #chapter 7
#$SCRIPT_PATH/build_basic_system.sh #chapter 8
#$SCRIPT_PATH/system_config/create_conf_files.sh #chapter 9
#$SCRIPT_PATH/system_config/config_systemd.sh #chapter 9
#$SCRIPT_PATH/system_config/create_fstab.sh #chapter 10
#$SCRIPT_PATH/build_linux_kernel.sh #chapter 10
$SCRIPT_PATH/install_grub2.sh #chapter 10
$SCRIPT_PATH/finish_install.sh #chapter 11
