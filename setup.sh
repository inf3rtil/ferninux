#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255

. set_env_vars.sh
. set_env_functions.sh


while true; do
    exec 3>&1
    selection=$(dialog \
		    --title "Ferninux Setup" \
		    --menu "Exec script" 0 0 6 \
		    "1" "Create Project" \
		    "2" "Build Cross-Toolchain" \
		    "3" "Build Root filesystem" \
		    "4" "Build Linux Kernel" \
		    "5" "Install bootloader" \
		    "6" "Start QEMU" \
		    "7" "Write image to disk" \
		    "8" "Clear Project" \
		    2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    clear
    case $exit_status in
	$DIALOG_CANCEL)
	    clear
	    exit
	    ;;
	$DIALOG_ESC)
	    clear
	    exit 1
	    ;;
    esac
    
    case $selection in
	1 )
	    create_isolated_env
	    add_isolated_user
	    create_download_list
	    download_sources
	    copy_sources_to_disk
	    ;;
	2 )
	    mount_devices
	    sudo --preserve-env=WORK_DIR,LFS_USER,ENV_VARS_EXPORTED,LFS,MAKEFLAGS,FERNINUX_TARGET_ARCH -u $LFS_USER \
		 bash -c 'source ~/.bashrc && $WORK_DIR/cross_toolchain/build_cross_toolchain.sh'
	    umount_devices
	    ;;
	3 )
	    export AUTOINSTALL=1
	    enter_chroot
	    unset AUTOINSTALL
	    ;;
	4 )
	    export INSTALL_KERNEL=1
	    enter_chroot
	    unset INSTALL_KERNEL
	    ;;
	5 )
	    export INSTALL_BOOTLOADER=1
	    enter_chroot
	    unset INSTALL_BOOTLOADER
	    ;;
	6 )
	    echo "TODO: not ready"
	    ;;
	7 )
	    echo "TODO: not ready"
	    ;;
	8 )
	    clear_env
	    ;;
    esac
    echo "Press any key to continue"
    read -n 1 -s
done

clear
