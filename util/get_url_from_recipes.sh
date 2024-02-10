#!/bin/bash

DIR=$WORK_DIR/install_scripts/packages/recipes/$FERNINUX_TARGET_ARCH

grep -Rh $DIR -e 'DOWNLOAD_URL*=' | cut -d '=' -f2 | grep "/" | sed -e 's/"//g' > $WORK_DIR/util/download_urls/chroot_scripts
