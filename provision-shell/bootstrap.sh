#!/bin/bash

# Include resources
LIV_DIR="/vagrant/provision-shell"
source "$LIV_DIR/resources/var.sh"
source "$LIV_DIR_RES/functions.sh"

LIV_N=$(($LIV_TUT_NO+1))
for (( LIV_I=0; LIV_I<=$LIV_N; LIV_I++ )) do
    if [ "$LIV_I" -eq "0" ]; then
        # Init provision shell script (begin)
        LIV_DIR_SCRIPT_CUR=$(liv_tutorial_path "$LIV_TUT_DIR_BEGIN")
    elif [ "$LIV_I" -eq "$LIV_N" ]; then
        # Cleanup provision shell script (end)
        LIV_DIR_SCRIPT_CUR=$(liv_tutorial_path "$LIV_TUT_DIR_END")
    else
        # Tutorial provision shell script
        LIV_DIR_SCRIPT_CUR=$(liv_tutorial_path "$LIV_I")
    fi

    if [ -d "$LIV_DIR_SCRIPT_CUR" ]; then
        # Display meta data
        LIV_TUT_INFO_PATH="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_SH_META"
        if [ -e "$LIV_TUT_INFO_PATH" ]; then
            source "$LIV_TUT_INFO_PATH"
            liv_print_section "$LIV_I" "$LIV_TUT_INFO_URL"
        fi

        # Load tutorial provision shell script (begin)
        # This script is always loaded because a working environment is needed
        LIV_TUT_SH="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_SH_BEGIN"
        if [ -e "$LIV_TUT_SH" ]; then
            source "$LIV_TUT_SH"
        fi

        # Load tutorial provision shell script (end)
        # This script is loaded if the tutorial is not the last one or is the last one and LIV_TUT_SH_END_LAST=1
        LIV_TUT_SH="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_SH_END"
        if [ -e "$LIV_TUT_SH" ] && ([ "$LIV_I" -lt "$LIV_TUT_NO" ] || ([ "$LIV_I" -eq "$LIV_TUT_NO" ] && [ "$LIV_TUT_SH_END_LAST" -eq "1" ])); then
            source "$LIV_TUT_SH"
        fi
    fi
done
