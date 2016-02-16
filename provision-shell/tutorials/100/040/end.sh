# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

LIV_TMP=$(cat "$LIV_DIR_SCRIPT_CUR/resources/mysql/my.sql")

# For more info see http://unix.stackexchange.com/questions/60688/how-to-defer-variable-expansion
eval "LIV_TMP=\"$LIV_TMP\""

# For more info see http://www.shellhacks.com/en/HowTo-Execute-a-MySQL-Command-from-a-Linux-BASH-Shell
mysql -u root "-p$LIV_USR_MYSQL_ROOT_PWD" -e "$LIV_TMP" > /dev/null 2>&1
