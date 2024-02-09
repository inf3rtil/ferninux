#!/bin/bash

DIR=$WORK_DIR/script/chroot_scripts/

grep -Rh $DIR -e 'DOWNLOAD_URL*=' | cut -d '=' -f2 | grep "/" | sed -e 's/"//g' > $WORK_DIR/util/download_urls/chroot_scripts
