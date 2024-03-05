#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

echo "auto installing ferninux"
$SCRIPT_PATH/basic_system/create_essential_files.sh #chapter 7
$SCRIPT_PATH/temp_tools/build_temp_tools.sh #chapter 7
#$SCRIPT_PATH/basic_system/build_basic_system.sh #chapter 8
#$SCRIPT_PATH/basic_system/system_config/$FERNINUX_TARGET_ARCH/create_conf_files.sh #chapter 9
#$SCRIPT_PATH/basic_system/system_config/$FERNINUX_TARGET_ARCH/config_systemd.sh #chapter 9
#$SCRIPT_PATH/basic_system/system_config/$FERNINUX_TARGET_ARCH/create_fstab.sh #chapter 10
#$SCRIPT_PATH/kernel/build_linux_kernel.sh #chapter 10
#$SCRIPT_PATH/basic_system/install_grub2.sh #chapter 10
#$SCRIPT_PATH/basic_system/finish_install.sh #chapter 11
#TODO: move for another script
#$SCRIPT_PATH/post_install/bash_startup_files.sh #BLFS
#$SCRIPT_PATH/packages/install_libraries.sh
#$SCRIPT_PATH/packages/install_utilities.sh
#$SCRIPT_PATH/packages/install_security.sh
#$SCRIPT_PATH/packages/install_xorg.sh
#$SCRIPT_PATH/packages/install_qt.sh
#$SCRIPT_PATH/packages/install_kde_kf5.sh
#$SCRIPT_PATH/packages/install_gtk.sh
#$SCRIPT_PATH/packages/install_plasma.sh
