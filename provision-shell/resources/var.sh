# Global variables

# Paths

# Resources dir absolute path
LIV_DIR_RES="$LIV_DIR/resources"

# Tutorials dir absolute path
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

# Maximum tutorial step until the provision will be made
LIV_TUT_NO=13

# Section provision tutorial message setup
LIV_TUT_SECTION_NO='Setup for Tutorial '

# Section provision tutorial info message
LIV_TUT_SECTION_URL='More info on '

# Directory where are stored the provision init shell scripts that will be run before any tutorial
LIV_TUT_DIR_BEGIN='begin'

# Directory where are stored the provision cleanup shell scripts that will be run after all the tutorials
LIV_TUT_DIR_END='end'

# Tutorial provision meta shell script
LIV_TUT_SH_META='meta.sh'

# Provision shell script that will be run at the beginning of the tutorial
# This section includes necessary initialization in order to be able to follow the tutorial
LIV_TUT_SH_BEGIN='begin.sh'

# Provision shell script that will be run at the end of the tutorial
# This is the result of the current tutorial
LIV_TUT_SH_END='end.sh'

# Run $LIV_TUT_SH_END provision shell script above for the last tutorial
# This will apply if your current tutorial number is $LIV_TUT_NO (the last one)
# Possible values: 0, 1
LIV_TUT_SH_END_LAST=1
