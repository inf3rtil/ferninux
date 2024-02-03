#!/bin/bash

#check if UEFI

grub-install $DISK_DEVICE --target i386-pc

cat > /boot/grub/grub.cfg << EOF
# Begin /boot/grub/grub.cfg

set default=0
set timeout=5
insmod part_gpt
insmod ext2
search --set=root --fs-uuid=$BOOT_PART_UUID
menuentry "GNU/Linux, Linux 6.4.12-lfs-12.0-systemd" {
	  linux   /vmlinuz-6.4.12-lfs-12.0-systemd root=PARTUUID=$ROOT_PART_PARTUUID ro
}
EOF
