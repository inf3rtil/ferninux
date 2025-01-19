#!/bin/bash

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solution:"
    echo "1 - source set_env_vars.sh"
    exit 1
fi

if [[ $(whoami) != "root" ]]; then
    echo "run this script as root user"
    exit 1
fi

mount_devices

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) chown -R root:root $LFS/lib64 ;;
esac

mkdir -pv $LFS/{dev,proc,sys,run}

# install ferninux scripts to run inside chrooted env
mkdir -pv $LFS/script
cp -pr $CHROOT_SCRIPTS_DIR/* $LFS/script/

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

# select a autorun script if AUTOINSTALL is set
if [[ $AUTOINSTALL -eq 1 ]]; then
    chroot_script="/script/ferninux.sh"
fi

if [[ $INSTALL_KERNEL -eq 1 ]]; then
    chroot_script="/script/kernel/build_linux_kernel.sh"
fi
    
chroot "$LFS" /usr/bin/env -i \
       HOME=/root \
       TERM="$TERM" \
       PS1='(lfs chroot) \u:\w\$ ' \
       PATH=/usr/bin:/usr/sbin \
       MAKEFLAGS=$MAKEFLAGS \
       USE_UEFI=$USE_UEFI \
       FERNINUX_TARGET_ARCH=$FERNINUX_TARGET_ARCH \
       INSTALLED_PACKAGES_FILE=$INSTALLED_PACKAGES_FILE \
       FERNINUX_KERNEL_VERSION=$FERNINUX_KERNEL_VERSION \
       USE_DEFAULT_KERNEL_CONFIG=$USE_DEFAULT_KERNEL_CONFIG \
       $(cat $BUILD_DIR/diskinfo) \
       DISK_DEVICE=$(losetup -j $BUILD_DIR/$VDISK_FILENAME | cut -d ':' -f1) \
       /bin/bash --login $chroot_script

echo "unmounting virtual filesystem"
umount -v $LFS/dev/pts
mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
umount -v $LFS/dev
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS/run

umount_devices

findmnt | grep $LFS

