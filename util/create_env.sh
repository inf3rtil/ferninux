#!/bin/bash

set -e

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

echo "creating directories"
mkdir -pv $BUILD_DIR
mkdir -pv $LFS
mkdir -pv $BACKUP_DIR
mkdir -pv $DOWNLOAD_DIR

if test -f "$BUILD_DIR/$VDISK_FILENAME"; then
    echo "$VDISK_FILENAME found"
    echo "mounting loop device"
    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_PATH)
    uefi_part=$disk_loop$VDISK_UEFI_PART
    root_part=$disk_loop$VDISK_ROOT_PART
    boot_part=$disk_loop$VDISK_BOOT_PART
else
    echo "$VDISK_FILENAME not found"
    
    echo "creating virtual disk image: $VDISK_FILENAME file"
    dd if=/dev/zero of=$VDISK_PATH bs=1G count=$VDISK_SIZE_GB status=progress
    
    
    if test $USE_UEFI; then
	echo "Creating UEFI partitions"
	
	parted -s $VDISK_PATH mklabel $VDISK_LABEL \
	       mkpart primary 1 2 \
	       mkpart primary fat32 2Mib 513Mib \
	       mkpart primary ext2 513Mib 1513Mib \
	       mkpart primary ext4 1513Mib 100%

	parted -s $VDISK_PATH set 1 bios_grub on \
	       set 2 esp on
    else
	echo "Creating partitions"
	
	parted -s $VDISK_PATH mklabel $VDISK_LABEL \
	       mkpart primary 1 2 \
	       mkpart primary ext2 2Mib 512Mib \
	       mkpart primary ext4 512Mib 100%

	parted -s $VDISK_PATH set 1 bios_grub on
    fi

    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_PATH)
    uefi_part=$disk_loop$VDISK_UEFI_PART
    root_part=$disk_loop$VDISK_ROOT_PART
    boot_part=$disk_loop$VDISK_BOOT_PART
    
    mkfs.ext2 -v $boot_part
    mkfs.ext4 -v $root_part

    if test $USE_UEFI; then
	mkfs.vfat -v -F32 $uefi_part
    fi


fi

echo "mounting root partition "
mount -v -t ext4 $root_part $LFS
mkdir -pv $LFS/boot
mount -v -t ext2 $boot_part $LFS/boot

if test $USE_UEFI; then
    mkdir -pv $LFS/boot/efi
fi

echo "creating directories"
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
    ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

echo "writing disk info"
echo "ROOT_PART_UUID=$(blkid -o value -s UUID $root_part)" > $BUILD_DIR/diskinfo
echo "ROOT_PART_PARTUUID=$(blkid -o value -s PARTUUID $root_part)" >> $BUILD_DIR/diskinfo
echo "BOOT_PART_UUID=$(blkid -o value -s UUID $boot_part)" >> $BUILD_DIR/diskinfo

if test $USE_UEFI; then
    echo "UEFI_PART_UUID=$(blkid -o value -s UUID $uefi_part)" >> $BUILD_DIR/diskinfo
fi

echo "cleaning"
umount -v $boot_part
umount -v $root_part
losetup --verbose -d $disk_loop

