# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# General functions

# Print with color and return to the default config foreground color
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
# $1 = Tutorial number
function liv_print_section {
    echo -e "$LIV_COLOR_INFO$LIV_TUT_SECTION_NO$LIV_COLOR_DANGER#$1"
    echo -e "$LIV_COLOR_INFO$LIV_TUT_SECTION_URL$LIV_COLOR_DANGER$2$LIV_COLOR_DEFAULT"
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

# Get tutorial path.
# This current file system structure is used in order to avoid sorting problems.
# Currently a 3 digits format is used. If you want to increase the number of digits all you have to do is to
# change the 2nd param for liv_smallest_multiple function and the 1st param for printf function used below.
# $1 = Tutorial number / directory name
function liv_tutorial_path {
    local LIV_PATH_CUR="$LIV_DIR_TUT"
    local LIV_TMP_CUR=''

    if [ $(liv_is_int "$1") = true ]; then
        LIV_TMP_CUR=$(liv_smallest_multiple $1 100)
        LIV_PATH_CUR="$LIV_PATH_CUR/$LIV_TMP_CUR"
        LIV_TMP_CUR=$(printf '%03d' $1)
        LIV_PATH_CUR="$LIV_PATH_CUR/$LIV_TMP_CUR"
    else
        LIV_PATH_CUR="$LIV_PATH_CUR/$1"
    fi

    echo "$LIV_PATH_CUR"
}

# Escape string used in sed command (search term).
# For more info see:
# https://robots.thoughtbot.com/sed-102-replace-in-place
# http://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script
# $1 = The value being searched for, otherwise known as the needle
function liv_sed_escape_search {
    local LIV_TMP="$1"

    # Replace "\" first
    # "\" => "\\"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\\/\\\\/g')

    # "^" => "\^"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\^/\\^/g')

    # "." => "\."
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\./\\./g')

    # "*" => "\*"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\*/\\*/g')

    # "[" => "\["
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\[/\\[/g')

    # "]" => "\]"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\]/\\]/g')

    # "/" => "\/"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\//\\\//g')

    # "$" => "\$"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\$/\\$/g')

    echo "$LIV_TMP"
}

# Escape string used in sed command (replace term)
# $1 = The replacement value that replaces found search values
function liv_sed_escape_replace {
    local LIV_TMP="$1"

    # Replace "\" first
    # "\" => "\\"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\\/\\\\/g')

    # "/" => "\/"
    LIV_TMP=$(echo "$LIV_TMP" | sed 's/\//\\\//g')

    echo "$LIV_TMP"
}

# Replace $1 (search string) with $2 (replace string) on $3 (file path).
# $1 and $2 are escaped so you cannot use patterns inside of them.
# For more info see https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux
# $1 = Search string
# $2 = Replace string
# $3 = File path
function liv_sed_replace {
    local LIV_TMP_SEARCH=$(liv_sed_escape_search "$1")
    local LIV_TMP_REPLACE=$(liv_sed_escape_replace "$2")

    sudo sed -i "s/$LIV_TMP_SEARCH/$LIV_TMP_REPLACE/g" "$3"
}

# Insert $2 (insert string) before $1 (search string) on $3 (file path).
# $1 and $2 are escaped so you cannot use patterns inside of them.
# For more info see http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/
# $1 = Search string
# $2 = Insert string
# $3 = File path
function liv_sed_insert_before {
    local LIV_TMP_SEARCH=$(liv_sed_escape_search "$1")
    local LIV_TMP_REPLACE=$(liv_sed_escape_replace "$2")

    sudo sed -i "/$LIV_TMP_SEARCH/ i $LIV_TMP_REPLACE" "$3"
}

# Insert $2 (insert string) after $1 (search string) on $3 (file path).
# $1 and $2 are escaped so you cannot use patterns inside of them.
# For more info see http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/
# $1 = Search string
# $2 = Insert string
# $3 = File path
function liv_sed_insert_after {
    local LIV_TMP_SEARCH=$(liv_sed_escape_search "$1")
    local LIV_TMP_REPLACE=$(liv_sed_escape_replace "$2")

    sudo sed -i "/$LIV_TMP_SEARCH/ a $LIV_TMP_REPLACE" "$3"
}

# Remove comment from $1 (search string) inside $3 (file path) based on $2 (comment start format; eg: "#").
# $1 and $2 are escaped so you cannot use patterns inside of them.
# $1 = Search string with comment
# $2 = Comment start format (eg: "#")
# $3 = File path
function liv_sed_remove_comment_line {
    local LIV_TMP_SEARCH=$(liv_sed_escape_search "$1")
    local LIV_TMP_COMMENT=$(liv_sed_escape_search "$2")
    local LIV_TMP_REPLACE=$(echo "$1" | sed "s/^\s*$LIV_TMP_COMMENT\s*//")

    sudo sed -i "s/$LIV_TMP_SEARCH/$LIV_TMP_REPLACE/g" "$3"
}