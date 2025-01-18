#!/bin/bash

set -e

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

if [[ $(whoami) != "root" ]]; then
    echo "run this script as root user"
    exit 1
fi

create_isolated_env(){

    echo "creating ferninux base directories"
    mkdir -pv $BUILD_DIR
    mkdir -pv $TEMP
    mkdir -pv $LFS
    mkdir -pv $BACKUP_DIR
    mkdir -pv $DOWNLOAD_DIR


    if test -f "$BUILD_DIR/$VDISK_FILENAME"; then
	echo "$VDISK_FILENAME already created"
    else
	echo "$VDISK_FILENAME not found, creating virtual disk image" 
	dd if=/dev/zero of=$VDISK_PATH bs=1G count=$VDISK_SIZE_GB status=progress
	
	if test $USE_UEFI -eq 1; then
	    echo "Creating partitions (UEFI mode)"
	    parted -s $VDISK_PATH mklabel $VDISK_LABEL \
		   mkpart primary fat32 1Mib 513Mib \
		   mkpart primary ext2 513Mib 1000Mib \
		   mkpart primary ext4 1000Mib 100%
	    echo "set efi flag on $VDISK_PATH partition 1"
	    parted -s $VDISK_PATH set 1 esp on
	    
	else
	    echo "Creating partitions (bios mode)"
	    parted -s $VDISK_PATH mklabel $VDISK_LABEL \
		   mkpart primary 1 2 \
		   mkpart primary ext2 2Mib 512Mib \
		   mkpart primary ext4 512Mib 100%
	    echo "set bios_grub flag on $VDISK_PATH partition 1"
	    parted -s $VDISK_PATH set 1 bios_grub on
	fi

	disk_loop=$(losetup --partscan --show --verbose --find $VDISK_PATH)
	uefi_part=$disk_loop$VDISK_EFI_PART
	root_part=$disk_loop$VDISK_ROOT_PART
	boot_part=$disk_loop$VDISK_BOOT_PART
	
	echo "formating partitions"
	mkfs.ext2 -v $boot_part
	mkfs.ext4 -v $root_part
	if test $USE_UEFI -eq 1; then
	    mkfs.vfat -v -F32 $uefi_part
	fi

	echo "mounting root partition"
	mount -v -t ext4 $root_part $LFS
	mkdir -pv $LFS/boot
	echo "mounting boot partition"
	mount -v -t ext2 $boot_part $LFS/boot
	echo "creating directories"
	if test $USE_UEFI -eq 1; then
	    mkdir -pv $LFS/boot/efi
	fi
	
	mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}
	
	for i in bin lib sbin; do
	    ln -sv usr/$i $LFS/$i
	done

	case $(uname -m) in
	    x86_64) mkdir -pv $LFS/lib64 ;;
	esac

	mkdir -pv $LFS/tools

	echo "writing disk info"
	echo "this file is generated create_env.sh" > $BUILD_DIR/diskinfo
	echo "ROOT_PART_UUID=$(blkid -o value -s UUID $root_part)" >> $BUILD_DIR/diskinfo
	echo "ROOT_PART_PARTUUID=$(blkid -o value -s PARTUUID $root_part)" >> $BUILD_DIR/diskinfo
	echo "BOOT_PART_UUID=$(blkid -o value -s UUID $boot_part)" >> $BUILD_DIR/diskinfo
	
	if test $USE_UEFI -eq 1; then
	    echo "UEFI_PART_UUID=$(blkid -o value -s UUID $uefi_part)" >> $BUILD_DIR/diskinfo
	fi

	echo "cleaning"
	umount -v $boot_part
	umount -v $root_part
	losetup --verbose -d $disk_loop
	
    fi

}
