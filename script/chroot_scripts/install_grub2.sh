#!/bin/bash

#check if UEFI

grub-install $DISK_DEVICE --target i386-pc

cat > /boot/grub/grub.cfg << EOF
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5
insmod ext2
set root=()
menuentry "GNU/Linux, Linux 6.1.11-lfs-11.3-systemd" {
linux
 /boot/vmlinuz-6.1.11-lfs-11.3-systemd root=/dev/sda2 ro
}
EOF
