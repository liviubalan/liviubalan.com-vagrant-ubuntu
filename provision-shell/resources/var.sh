# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Global variables

# User credentials

# The user that should be generated on the installation process of Ubuntu Server.
# Because instead of manually creating the VM this is done by using Vagrant, this user must be explicitly created.
# For more info see http://www.liviubalan.com/install-ubuntu-14-04-lts-server-on-virtualbox
LIV_USR_ADM_USER='liviu'

# Name for $LIV_USR_ADM_USER
LIV_USR_ADM_NAME='Liviu Balan'

# Password for $LIV_USR_ADM_USER.
# This password is also used when connecting to the VM through SSH
LIV_USR_ADM_PWD='pwd-liviu'

# Regular user created on tutorial http://www.liviubalan.com/create-and-delete-users-on-ubuntu-server
# This user is used for Apache HTTP Server tasks
LIV_USR_WWW_USER='liviu.balan'

# Name for $LIV_USR_WWW_USER
LIV_USR_WWW_NAME='Liviu Balan'

# Password for $LIV_USR_WWW_USER.
# This password is also used when connecting to the VM through SSH
LIV_USR_WWW_PWD='pwd-liviu.balan'

# Password for root MySQL server
LIV_USR_MYSQL_ROOT_PWD='pwd-mysql-root'

# Regular MySQL user
LIV_USR_MYSQL_USR_USR='usrmysql'

# Regular MySQL user password
LIV_USR_MYSQL_USR_PWD='pwd-mysql-usrmysql'

# Paths

# Resources directory absolute path
LIV_DIR_RES="$LIV_DIR_PROVISION/resources"

# Tutorials directory absolute path
LIV_DIR_TUT="$LIV_DIR_PROVISION/tutorials"

# Shared directory absolute path.
# The content of this directory will be used for things like Apache2 DocumentRoot and will ensure the communication
# between the host machine with the guest virtual machine
LIV_DIR_SHR="$LIV_DIR_ROOT/share"

# Apache2 shared directory
LIV_DIR_SHR_APACHE="$LIV_DIR_SHR/apache2"

# Colors

# Default message color
LIV_COLOR_DEFAULT='\e[39m'

# Success message color
LIV_COLOR_SUCCESS='\e[32m'

# Info message color
LIV_COLOR_INFO='\e[34m'

# Warning message color
LIV_COLOR_WARNING='\e[33m'

# Danger message color
LIV_COLOR_DANGER='\e[31m'

# Tutorials

# Tutorials are numbered starting from "1" and correspond to the # title part from http://www.liviubalan.com/
# Remember that "vagrant provision" command is useful for incremental development but for decremental development
# you may get in some trouble and you will have to use:
# vagrant destroy -f
# vagrant up --provider virtualbox
# For more info see http://www.liviubalan.com/vagrant-provision-command

# Tutorial start step from which the provision will begin.
# You may want to change this value in order to decrease the provision loading time in case that you want to use
# incremental development.
# Default value: 1
LIV_TUT_NO_START=1

# Maximum tutorial step until the provision will be made.
# You may want to change this value in order to decrease the provision loading time in case that you want to use
# incremental development.
# Default value: last tutorial number
LIV_TUT_NO_STOP=54

# Run the begin (init) provision shell script.
# This script will be run before any tutorial provision shell script.
# In order to avoid problems is recommended to let the default as is and if you want to decrease the provision loading
# time you can change the other 'LIV_TUT_NO_*' configuration options.
# Possible values: 0, 1
# Default value: 1
LIV_TUT_NO_BEGIN=1

# Run the end (cleanup) provision shell script.
# This script will be run after all the tutorial provision shell scripts.
# Possible values: 0, 1
# Default value: 1
LIV_TUT_NO_END=1

# Downloads the package lists from the repositories and "updates" them to get information on the newest
# versions of packages and their dependencies.
# You may want to change this value in case that you want to use incremental development.
# In order to apply this option, you have to set "LIV_TUT_NO_BEGIN=1"
# Possible values: 0, 1
# Default value: 1
LIV_TUT_NO_BEGIN_APT_UPDATE=1

# Remove all the files inside the shared directory.
# You may want to change this value in case that you want to use incremental development.
# Changing this value usually implies changing the values for LIV_TUT_NO_START and LIV_TUT_NO_STOP also.
# In order to apply this option, you have to set "LIV_TUT_NO_BEGIN=1"
# Possible values: 0, 1
# Default value: 1
LIV_TUT_NO_BEGIN_SHR_CLEAN=1

# Section provision tutorial message setup
LIV_TUT_SECTION_NO='Setup for Tutorial '

# Section provision tutorial info message
LIV_TUT_SECTION_URL='More info on '

# Directory where are stored the provision init shell scripts that are run before any tutorial
LIV_TUT_DIR_BEGIN='begin'

# Directory where are stored the provision cleanup shell scripts that are run after all the tutorials
LIV_TUT_DIR_END='end'

# Tutorial provision meta shell script
LIV_TUT_SH_META='meta.sh'

# Provision shell script that is run at the beginning of the tutorial.
# This section includes necessary initialization in order to be able to follow the tutorial
LIV_TUT_SH_BEGIN='begin.sh'

# Provision shell script that is run at the end of the tutorial.
# This is the result of the current tutorial
LIV_TUT_SH_END='end.sh'

# Message shown when no provision shell script is specified for the current tutorial
LIV_TUT_SH_NONE='No provision shell script specified for this tutorial'

# Run $LIV_TUT_SH_END provision shell script above for the last tutorial.
# This will apply if your current tutorial number is $LIV_TUT_NO_STOP (the last one).
# Possible values: 0, 1
# Default value: 0
LIV_TUT_SH_END_LAST=0
