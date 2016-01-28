# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# This shell script is run before any tutorial
# Here is the init part

# Repair "==> default: stdin: is not a tty" message
# For more info see http://www.liviubalan.com/vagrant-repair-default-stdin-is-not-a-tty-message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

# In order to avoid the message
# "==> default: dpkg-preconfigure: unable to re-open stdin: No such file or directory"
# use " > /dev/null 2>&1" in order to redirect stdout to /dev/null
# For more info see http://stackoverflow.com/questions/10508843/what-is-dev-null-21

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
sudo locale-gen en_US.UTF-8 > /dev/null 2>&1

# Do not allow client to pass locale environment variables through SSH
# For more info see http://www.liviubalan.com/vagrant-repair-setting-locale-failed-message-on-ubuntutrusty32
sudo sed -i 's/^AcceptEnv LANG LC/#AcceptEnv LANG LC/g' /etc/ssh/sshd_config

# Change timezone to "Europe/Bucharest" according to http://www.liviubalan.com/install-ubuntu-14-04-lts-server-on-virtualbox
# For more info see http://www.liviubalan.com/ubuntu-server-change-and-overview-timezone
sudo bash -c 'echo "Europe/Bucharest" > /etc/timezone'
sudo dpkg-reconfigure -f noninteractive tzdata > /dev/null 2>&1

# Downloads the package lists from the repositories and "updates" them to get information on the newest
# versions of packages and their dependencies
sudo apt-get -qq update

# Remove all files from the shared directory
sudo rm -rf "$LIV_DIR_SHR/*"
