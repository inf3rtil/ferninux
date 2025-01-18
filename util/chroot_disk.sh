#!/bin/bash

# TODO: review use

device=$(mount | grep $LFS | cut -d ' ' -f1)

if [[ -z $device ]]; then
	mount -v -t ext4 /dev/sdb4 $LFS
	mount -v -t ext2 /dev/sdb3 $LFS/boot
    mount -v /dev/sdb2 $LFS/boot/efi
else
    echo "$device already mounted"
fi

mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
else
  mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

findmnt | grep $LFS

chroot "$LFS" /usr/bin/env -i \
       HOME=/root \
       TERM="$TERM" \
       PS1='(lfs chroot) \u:\w\$ ' \
       PATH=/usr/bin:/usr/sbin \
       MAKEFLAGS=$MAKEFLAGS \
       USE_UEFI=$USE_UEFI \
       $(cat $BUILD_DIR/diskinfo) \
       DISK_DEVICE=$(losetup -j $BUILD_DIR/$VDISK_FILENAME | cut -d ':' -f1) \
       /bin/bash --login

echo "unmounting virtual filesystem"
umount -v $LFS/dev/pts
mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
umount -v $LFS/dev
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS/run

if test $USE_UEFI; then
    device_uefi=$(mount | grep $LFS/boot/efi | cut -d ' ' -f1)
    if [[ -n $device_uefi ]]; then
	umount -v $device_uefi
    fi
fi

device_boot=$(mount | grep $LFS/boot | cut -d ' ' -f1)

if [[ -n $device_boot ]]; then
    umount -v $device_boot
fi

device_root=$(mount | grep $LFS | cut -d ' ' -f1)
if [[ -n $device_root ]]; then
    umount -v $device_root
fi


findmnt | grep $LFS

