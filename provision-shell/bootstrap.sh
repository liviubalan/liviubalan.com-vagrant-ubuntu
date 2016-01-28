#!/bin/bash

# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# In order to avoid naming collisions I've used the "LIV_" prefix for all the resources in this project.
# LIV stands for LIViu Balan :)

# Include resources

# By default, Vagrant will share your project directory (the directory with the Vagrantfile) to /vagrant.
# If you want to run this script using another shared directory or you want to run it to other environment than Vagrant
# change this value to an absolute path directory.
# For more info see http://www.liviubalan.com/vagrant-synced-folders
LIV_DIR_ROOT='/vagrant'

# Provision shell directory absolute path
LIV_DIR_PROVISION="$LIV_DIR_ROOT/provision-shell"

source "$LIV_DIR_PROVISION/resources/var.sh"
source "$LIV_DIR_RES/functions.sh"

# Run the init, tutorial and cleanup scripts based on the configuration values
LIV_N=$(($LIV_TUT_NO_STOP+1))
for (( LIV_I=$LIV_TUT_NO_START; LIV_I<=$LIV_N; LIV_I++ )) do
    if [ "$LIV_I" -eq '0' ]; then
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
        LIV_TUT_META_PATH="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_SH_META"
        if [ -e "$LIV_TUT_META_PATH" ]; then
            source "$LIV_TUT_META_PATH"

            if [ ${#LIV_TUT_META_URL} -gt '0' ]; then
                liv_print_section "$LIV_I" "$LIV_TUT_META_URL"
            fi

            if [ ${#LIV_TUT_META_DESCR} -gt '0' ]; then
                liv_print_default "$LIV_TUT_META_DESCR"
            fi
        fi

        LIV_TUT_SH_BEGIN_I="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_SH_BEGIN"
        LIV_TUT_SH_END_I="$LIV_DIR_SCRIPT_CUR/$LIV_TUT_SH_END"
        if [ -e "$LIV_TUT_SH_BEGIN_I" ] || [ -e "$LIV_TUT_SH_END_I" ]; then
            # Load tutorial provision shell script (begin)
            # This script is always loaded because a working environment is needed
            if [ -e "$LIV_TUT_SH_BEGIN_I" ]; then
                source "$LIV_TUT_SH_BEGIN_I"
            fi

            # Load tutorial provision shell script (end)
            # This script is loaded if the tutorial is not the last one or is the last one and LIV_TUT_SH_END_LAST=1
            if [ -e "$LIV_TUT_SH_END_I" ] && ([ "$LIV_I" -lt "$LIV_TUT_NO_STOP" ] || ([ "$LIV_I" -eq "$LIV_TUT_NO_STOP" ] && [ "$LIV_TUT_SH_END_LAST" -eq '1' ])); then
                source "$LIV_TUT_SH_END_I"
            fi
        else
            liv_print_warning "$LIV_TUT_SH_NONE"
        fi

        # Unset current tutorial meta variables
        LIV_TUT_META_URL=''
        LIV_TUT_META_DESCR=''
    fi
done
