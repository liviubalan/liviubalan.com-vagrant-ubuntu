# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

LIV_TMP_SEARCH=$(cat "$LIV_DIR_SCRIPT_CUR/resources/mysql/my-search.cnf")
LIV_TMP_REPLACE=$(cat "$LIV_DIR_SCRIPT_CUR/resources/mysql/my-replace.cnf")
liv_sed_insert_after_once "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/mysql/my.cnf

# Restart MySQL to make these changes take effect
sudo service mysql restart > /dev/null 2>&1
