# General functions

# Print with color and return to default foreground color
# $1 = Message
# $2 = Color. Default to $LIV_COLOR_DEFAULT
function liv_print_color {
    if [ "$#" -gt 0 ]; then
        local LIV_COLOR_CUR=$LIV_COLOR_DEFAULT

        if [ "$#" -gt 1 ]; then
            LIV_COLOR_CUR=$2
        fi
        echo -e "$LIV_COLOR_CUR$1$LIV_COLOR_DEFAULT"
    fi
}

# Print default message
# $1 = Message
function liv_print_default {
    liv_print_color "$1" "$LIV_COLOR_DEFAULT"
}

# Print success message
# $1 = Message
function liv_print_success {
    liv_print_color "$1" "$LIV_COLOR_SUCCESS"
}

# Print info message
# $1 = Message
function liv_print_info {
    liv_print_color "$1" "$LIV_COLOR_INFO"
}

# Print warning message
# $1 = Message
function liv_print_warning {
    liv_print_color "$1" "$LIV_COLOR_WARNING"
}

# Print danger message
# $1 = Message
function liv_print_danger {
    liv_print_color "$1" "$LIV_COLOR_DANGER"
}

# Print section message
# $1 = Message
function liv_print_section {
    echo -e "$LIV_COLOR_INFO$LIV_TUT_SECTION_NO$LIV_COLOR_DANGER#$1
$LIV_COLOR_INFO$LIV_TUT_SECTION_URL$LIV_COLOR_DANGER$2$LIV_COLOR_DEFAULT\n"
}

# Check if a string is integer
# $1 = Checked string
function liv_is_int {
    if [[ $1 =~ ^-?[0-9]+$ ]]; then
        echo true
    else
        echo false
    fi
}

# Get the smallest number which is greater than or equal to $1 and is a multiple by $2
# $1 = Current number
# $2 = Multiple
function liv_smallest_multiple {
    local LIV_I=100

    while [ $1 -gt $LIV_I ]; do
        LIV_I=$[LIV_I + 100]
    done

    echo "$LIV_I"
}

# Get tutorial path
# $1 = Tutorial number
function liv_tutorial_path {
    local LIV_PATH_CUR="$LIV_DIR_TUT"
    local LIV_TMP_CUR=''

    if [ $(liv_is_int "$1") = true ]; then
        LIV_TMP_CUR=$(liv_smallest_multiple $1 100)
        LIV_PATH_CUR="$LIV_PATH_CUR/$LIV_TMP_CUR"
        LIV_TMP_CUR=$(printf "%03d" $1)
        LIV_PATH_CUR="$LIV_PATH_CUR/$LIV_TMP_CUR"
    else
        LIV_PATH_CUR="$LIV_PATH_CUR/$1"
    fi

    echo "$LIV_PATH_CUR"
}
