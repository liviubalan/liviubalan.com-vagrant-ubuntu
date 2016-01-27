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
# If you want to run this script using another shared directory or you want to run it to another environment than
# Vagrant change the value for LIV_DIR to an absolute path to your provision-shell directory.
# For more info see http://www.liviubalan.com/vagrant-synced-folders
LIV_DIR='/vagrant/provision-shell'

source "$LIV_DIR/resources/var.sh"
source "$LIV_DIR_RES/functions.sh"

# Run the init, tutorial and cleanup scripts based on the configuration values
LIV_N=$(($LIV_TUT_NO+1))
for (( LIV_I=0; LIV_I<=$LIV_N; LIV_I++ )) do
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
                liv_print_warning "$LIV_TUT_META_DESCR"
            fi
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
        if [ -e "$LIV_TUT_SH" ] && ([ "$LIV_I" -lt "$LIV_TUT_NO" ] || ([ "$LIV_I" -eq "$LIV_TUT_NO" ] && [ "$LIV_TUT_SH_END_LAST" -eq '1' ])); then
            source "$LIV_TUT_SH"
        fi

        # Unset current tutorial meta variables
        LIV_TUT_META_URL=''
        LIV_TUT_META_DESCR=''
    fi
done
