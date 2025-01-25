#!/bin/bash

set -e

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

add_isolated_user(){

    if test $(cut -d: -f1 /etc/group | grep $LFS_USER) == $LFS_USER; then
	echo "group found"
    else
	echo "group not found"
	groupadd $LFS_USER
    fi

    if test $(cut -d: -f1 /etc/passwd | grep $LFS_USER) == $LFS_USER; then
	echo "user found"
    else
	echo "user not found"
	useradd -s /bin/bash -g $LFS_USER -m -k /dev/null $LFS_USER
	passwd $LFS_USER
    fi

    su -c "cat > ~/.bash_profile << 'EOF'
exec env -i HOME=\$HOME TERM=\$TERM PS1='\u:\w\$ ' /bin/bash
EOF" $LFS_USER

    su -c "cat ~/.bash_profile" $LFS_USER

    su -c "cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=$LFS
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
# prevent shell contamination
CONFIG_SITE=$LFS/usr/share/config.site 
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF" $LFS_USER

    su -c "cat ~/.bashrc" $LFS_USER

    if test -f "$BUILD_DIR/$VDISK_FILENAME"; then
	umount_devices
	echo "$VDISK_FILENAME found"
	echo "mounting loop device"
	disk_loop=$(losetup --partscan --show --verbose --find $VDISK_PATH)
	root_part=$disk_loop$VDISK_ROOT_PART
	boot_part=$disk_loop$VDISK_BOOT_PART

	echo "mounting root partition "
	mount -v -t ext4 $root_part $LFS
	echo "mounting boot partition"
	mount -v -t ext2 $boot_part $LFS/boot    
	
	chown -v $LFS_USER $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
	case $(uname -m) in
	    x86_64) chown -v $LFS_USER $LFS/lib64 ;;
	esac

	umount -v $boot_part
	umount -v $root_part
	losetup --verbose -d $disk_loop
    else
	echo "$VDISK_FILENAME not found"
	echo "Please create env before lfs user"
    fi
    
    echo "add $LFS_USER to $(stat -c "%G" $WORK_DIR) group"
    usermod -aG $(stat -c "%G" $WORK_DIR) $LFS_USER

}
