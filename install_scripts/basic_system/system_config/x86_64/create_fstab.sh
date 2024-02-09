#!/bin/bash

if test $USE_UEFI -eq 1; then

    cat > /etc/fstab << EOF
# Begin /etc/fstab
# file system		mount-point	type	options		dump fsck order
UUID=$UEFI_PART_UUID              /boot/efi    vfat      defaults       0       2     
UUID=$BOOT_PART_UUID		  /boot	       ext2 	 defaults	1	1
UUID=$ROOT_PART_UUID		  /	       ext4	 defaults	1	1

# End /etc/fstab
EOF
   
cat /etc/fstab

else

    cat > /etc/fstab << EOF
# Begin /etc/fstab
# file system		mount-point	type	options		dump fsck order
UUID=$BOOT_PART_UUID		  /boot	       ext2 	 defaults	1	1
UUID=$ROOT_PART_UUID		  /	       ext4	 defaults	1	1

# End /etc/fstab
EOF

cat /etc/fstab

fi
