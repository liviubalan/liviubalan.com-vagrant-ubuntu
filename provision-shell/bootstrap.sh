#!/bin/bash

# Include resources
LIV_DIR="/vagrant/provision-shell"
source "$LIV_DIR/resources/var.sh"
source "$LIV_DIR_RES/functions.sh"

for (( i=0; i<=$LIV_TUT_NO; i++ )) do
    LIV_DIR_SCRIPT_CUR="$LIV_DIR_TUT/$i"
    if [ -d "$LIV_DIR_SCRIPT_CUR" ]; then
        # Display data from info script
        LIV_TUT_INFO_PATH="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_FILE_INFO"
        if [ -e "$LIV_TUT_INFO_PATH" ]; then
            source "$LIV_TUT_INFO_PATH"
            liv_print_section "$i" "$LIV_TUT_INFO_URL"
        fi

        # Load bootstrap script
        LIV_TUT_BOOT="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_FILE_BOOT"
        if [ -e "$LIV_TUT_BOOT" ]; then
            source "$LIV_TUT_BOOT"
        fi
    fi
done
