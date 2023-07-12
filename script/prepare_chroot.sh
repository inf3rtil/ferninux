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

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) chown -R root:root $LFS/lib64 ;;
esac

mkdir -pv $LFS/{dev,proc,sys,run}

mkdir -pv $LFS/script
cp -pv $CHROOT_SCRIPTS_DIR/*.sh $LFS/script/

mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

findmnt | grep $LFS

chroot "$LFS" /usr/bin/env -i \
       HOME=/root \
       TERM="$TERM" \
       PS1='(lfs chroot) \u:\w\$ ' \
       PATH=/usr/bin:/usr/sbin \
       /bin/bash --login

echo "unmounting virtual filesystem"
umount -v $LFS/dev/pts
umount -v $LFS/dev
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS/run

findmnt | grep $LFS

