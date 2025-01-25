#!/bin/bash

#TODO: set bootloader in set_env_vars.sh
#TODO: get kernel version from env var

if test $USE_UEFI -eq 1; then

    mountpoint /sys/firmware/efi/efivars || mount -v -t efivarfs efivarfs /sys/firmware/efi/efivars
    
    grub-install --bootloader-id=LFS --recheck
    efibootmgr | cut -f 1

    cat > /boot/grub/grub.cfg << EOF
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2

search --no-floppy --set=root --fs-uuid=$BOOT_PART_UUID

insmod all_video

if loadfont /grub/fonts/unicode.pf2; then
  terminal_output gfxterm
fi

menuentry "GNU/Linux, Ferninux Linux 6.7.4-lfs-12.1-systemd"  {
  linux   /vmlinuz-6.7.4-lfs-12.1-systemd root=PARTUUID=$ROOT_PART_PARTUUID ro
}

menuentry "Firmware Setup" {
  fwsetup
}
EOF

else

    grub-install $DISK_DEVICE --target i386-pc

    cat > /boot/grub/grub.cfg << EOF
# Begin /boot/grub/grub.cfg

set default=0
set timeout=5
insmod part_gpt
insmod ext2
search --set=root --fs-uuid=$BOOT_PART_UUID
menuentry "GNU/Linux, Ferninux Linux 6.4.12-lfs-12.0-systemd" {
	  linux   /vmlinuz-6.4.12-lfs-12.0-systemd root=PARTUUID=$ROOT_PART_PARTUUID ro
}
EOF

fi

cat /boot/grub/grub.cfg
/script/basic_system/finish_install.sh


