#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255

. set_env_vars.sh

set -e


while true; do
    exec 3>&1
    selection=$(dialog \
		    --title "Ferninux Setup" \
		    --menu "Exec script" 0 0 6 \
		    "1" "Create Project" \
		    "2" "Build Cross-Toolchain" \
		    "3" "Build Linux system" \
		    "4" "Start QEMU" \
		    "5" "Write image to disk" \
		    "6" "Clear Project" \
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
	    $WORK_DIR/util/create_env.sh
	    $WORK_DIR/util/add_lfs_user.sh
	    $WORK_DIR/util/download_sources.sh
	    ;;
	2 )
	    $WORK_DIR/util/mount_devices.sh
	    sudo --preserve-env=WORK_DIR,LFS_USER,ENV_VARS_EXPORTED,LFS,MAKEFLAGS,FERNINUX_TARGET_ARCH -u $LFS_USER \
		 bash -c 'source ~/.bashrc && $WORK_DIR/cross_toolchain/build_cross_toolchain.sh'
	    $WORK_DIR/util/umount_devices.sh
	    ;;
	3 )
	    export AUTOINSTALL=1
	    $WORK_DIR/util/enter_chroot.sh
	    unset AUTOINSTALL
	    ;;
	4 )
	    $WORK_DIR/util/start_qemu.sh
	    ;;
	5 )
	    dd if=$WORK_DIR/build/$VDISK_FILENAME $TARGET_PHY_DISK
	    ;;
	6 )
	    $WORK_DIR/util/clean.sh
	    ;; 
    esac
    echo "Press any key to continue"
    read -n 1 -s
done

clear
