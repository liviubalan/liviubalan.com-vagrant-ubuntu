# General functions

# Print with color and return to default foreground color
# $1 = Message
# $2 = Color. Default to $LIV_COLOR_DEFAULT
function liv_print_color {
    if [ "$#" -gt 0 ]; then
        local COLOR=$LIV_COLOR_DEFAULT
        if [ "$#" -gt 1 ]; then
            COLOR=$2
        fi
        echo -e "$COLOR$1$LIV_COLOR_DEFAULT"
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
