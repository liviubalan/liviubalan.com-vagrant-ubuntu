#!/bin/bash

# Repair "==> default: stdin: is not a tty" message
# For more info see http://www.liviubalan.com/vagrant-repair-default-stdin-is-not-a-tty-message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

# Set locale environment variables for current session
# For more info see http://www.liviubalan.com/vagrant-repair-setting-locale-failed-message-on-ubuntutrusty32
LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=

# Compile a list of locale definition files
# For more info see http://www.liviubalan.com/ubuntu-server-locales
sudo locale-gen en_US.UTF-8

# Do not allow client to pass locale environment variables through SSH
# For more info see http://www.liviubalan.com/vagrant-repair-setting-locale-failed-message-on-ubuntutrusty32
sudo sed -i "s/^AcceptEnv LANG LC/#AcceptEnv LANG LC/g" /etc/ssh/sshd_config

# Restart SSH service
sudo service ssh restart

# Change timezone to "Europe/Bucharest" according to http://www.liviubalan.com/install-ubuntu-14-04-lts-server-on-virtualbox
# For more info see http://www.liviubalan.com/ubuntu-server-change-and-overview-timezone
sudo bash -c 'echo "Europe/Bucharest" > /etc/timezone'
sudo dpkg-reconfigure -f noninteractive tzdata

# In order to avoid the message
# "==> default: dpkg-preconfigure: unable to re-open stdin: No such file or directory"
# use " > /dev/null 2>&1" in order to redirect stdout to /dev/null
# For more info see http://stackoverflow.com/questions/10508843/what-is-dev-null-21

echo 'Provisioning virtual machine...'

# Git
echo 'Installing Git...'
sudo apt-get -y install git > /dev/null 2>&1

echo 'Removing Git...'
sudo apt-get -y purge git > /dev/null 2>&1

# Include resources
LIV_DIR="/vagrant/provision-shell"
source "$LIV_DIR/resources/var.sh"
source "$LIV_DIR_RES/functions.sh"

for (( i=1; i<=$LIV_TUT_NO; i++ )) do
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
