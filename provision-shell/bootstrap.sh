#!/bin/bash

# Repair "==> default: stdin: is not a tty" message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

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
