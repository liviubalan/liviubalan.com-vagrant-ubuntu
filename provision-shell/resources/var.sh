# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Global variables

# Paths

# Resources directory absolute path
LIV_DIR_RES="$LIV_DIR/resources"

# Tutorials directory absolute path
LIV_DIR_TUT="$LIV_DIR/tutorials"

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

# Maximum tutorial step until the provision will be made.
#
# If you want just a clean Vagrant VM WITHOUT INIT, CLEANUP or TUTORIAL provision shell scripts set this value to "-2".
# If you want just a clean Vagrant VM WITH INIT provision shell script and WITHOUT CLEANUP and TUTORIAL provision shell
# scripts set this value to "-1".
# If you want just a clean Vagrant VM WITH INIT and CLEANUP provision shell scripts but WITHOUT TUTORIAL shell scripts
# set this value to "0".
# Tutorials are numbered starting from "1" and correspond to the # title part from http://www.liviubalan.com/
#
# Remember that "vagrant provision" command is useful for incremental development but if decrease this value you may
# get in some trouble and you will have to use:
# vagrant destroy -f
# vagrant up --provider virtualbox
# For more info see http://www.liviubalan.com/vagrant-provision-command
LIV_TUT_NO=14

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
# This will apply if your current tutorial number is $LIV_TUT_NO (the last one).
# Possible values: 0, 1
LIV_TUT_SH_END_LAST=1
