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

if test -f "$WORK_DIR/$VDISK_FILENAME"; then
    echo "$VDISK_FILENAME found"
    echo "mounting loop device"
    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_PATH)
    root_part=$disk_loop$VDISK_ROOT_PART
    boot_part=$disk_loop$VDISK_BOOT_PART
else
    echo "$VDISK_FILENAME not found"
    
    echo "creating virtual disk image: $VDISK_FILENAME file"
    dd if=/dev/zero of=$VDISK_PATH bs=1G count=$VDISK_SIZE_GB status=progress

    echo "creating $VDISK_LABEL label on $VDISK_FILENAME"
    parted -s $VDISK_PATH mklabel $VDISK_LABEL

    echo "creating BIOS boot partition on $VDISK_FILENAME"
    parted -s $VDISK_PATH mkpart primary 1 2
    parted -s $VDISK_PATH set 1 bios_grub on
    
    echo "creating boot partition on $VDISK_FILENAME"
    parted -s $VDISK_PATH mkpart boot ext2 2Mib 512Mib
    echo "creating root partition on $VDISK_FILENAME"
    parted -s $VDISK_PATH mkpart root ext4 512Mib 100%
   # echo "set esp flag on boot partition"
   # parted -s $VDISK_PATH set 1 esp on
    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_PATH)
    root_part=$disk_loop$VDISK_ROOT_PART
    boot_part=$disk_loop$VDISK_BOOT_PART
    echo "format boot partition"
    mkfs.ext2 -v $boot_part
#    mkfs.vfat -v -F32 $disk_loop\p1
    echo "formate root partition as ext4"
    mkfs.ext4 -v $root_part
fi

echo "mounting root partition "
mount -v -t ext4 $root_part $LFS_DIR
mkdir -pv $LFS_DIR/boot
mount -v -t ext2 $boot_part $LFS_DIR/boot

echo "creating directories"
mkdir -pv $LFS_DIR/sources
chmod -v a+wt $LFS_DIR/sources
mkdir -pv $LFS_DIR/{etc,var} $LFS_DIR/usr/{bin,lib,sbin}

for i in bin lib sbin; do
    ln -sv usr/$i $LFS_DIR/$i
done

case $(uname -m) in
    x86_64) mkdir -pv $LFS_DIR/lib64 ;;
esac

mkdir -pv $LFS_DIR/tools

echo "writing disk info"
echo "ROOT_PART_UUID=$(blkid -o value -s UUID $root_part)" > $BUILD_DIR/diskinfo
echo "ROOT_PART_PARTUUID=$(blkid -o value -s PARTUUID $root_part)" >> $BUILD_DIR/diskinfo
echo "BOOT_PART_UUID=$(blkid -o value -s UUID $boot_part)" >> $BUILD_DIR/diskinfo

echo "cleaning"
umount -v $boot_part
umount -v $root_part
losetup --verbose -d $disk_loop

