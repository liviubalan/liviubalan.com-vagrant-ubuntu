# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Hide Apache Version
LIV_TMP_SEARCH=$(cat "$LIV_DIR_SCRIPT_CUR/resources/apache/apache2-search.conf")
LIV_TMP_REPLACE=$(cat "$LIV_DIR_SCRIPT_CUR/resources/apache/apache2-replace.conf")
liv_sed_insert_before_once "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/apache2/apache2.conf

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
