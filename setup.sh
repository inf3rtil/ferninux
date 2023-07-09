#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255

while true; do
    exec 3>&1
    selection=$(dialog \
		    --title "Ferninux Setup" \
		    --menu "Exec script" 0 0 6 \
		    "1" "Create Env devices" \
		    "2" "Setup Env" \
		    "3" "Create special user" \
		    "4" "Download sources" \
		    "5" "Umount devices" \
		    "6" "Clear Env" \
		    2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    clear
    case $exit_status in
	$DIALOG_CANCEL)
	    exit
	    ;;
	$DIALOG_ESC)
	    exit 1
	    ;;
    esac
    case $selection in
	1 )
	    ./script/create_env.sh
	    ;;
	2 )
	    ./script/setup_env.sh
	    ;;
	3 )
	    ./script/add_lfs_user.sh
	    ;;
	4 )
	    ./script/get_sources.sh
	    ;;
	5 )
	    ./script/umount_loop.sh
	    ;;
	6 )
	    ./script/clean.sh
	    ;; 
    esac
    echo "Press any key to continue"
    read -n 1 -s
done
