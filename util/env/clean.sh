#!/bin/bash

clear_env(){
    rm -rfv $BUILD_DIR
    if [[ $KEEP_DOWNLOAD_FILES -eq 0 ]]; then
	rm -rfv $DOWNLOAD_DIR
    fi
    rm -rfv $BACKUP_DIR
}
