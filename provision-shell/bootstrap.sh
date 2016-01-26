#!/bin/bash

# Include resources
LIV_DIR="/vagrant/provision-shell"
source "$LIV_DIR/resources/var.sh"
source "$LIV_DIR_RES/functions.sh"

for (( LIV_I=0; LIV_I<=$LIV_TUT_NO; LIV_I++ )) do
    if [ "$LIV_I" -eq "0" ]; then
        LIV_DIR_SCRIPT_CUR=$(liv_tutorial_path 'before')
    else
        LIV_DIR_SCRIPT_CUR=$(liv_tutorial_path "$LIV_I")
    fi

    if [ -d "$LIV_DIR_SCRIPT_CUR" ]; then
        # Display data from info script
        LIV_TUT_INFO_PATH="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_FILE_INFO"
        if [ -e "$LIV_TUT_INFO_PATH" ]; then
            source "$LIV_TUT_INFO_PATH"
            liv_print_section "$LIV_I" "$LIV_TUT_INFO_URL"
        fi

        # Load bootstrap script
        LIV_TUT_BOOT="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_FILE_BOOT"
        if [ -e "$LIV_TUT_BOOT" ]; then
            source "$LIV_TUT_BOOT"
        fi
    fi
done
