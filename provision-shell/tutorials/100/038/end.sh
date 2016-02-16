# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# This config file applies to HTTP only, not for CLI
LIV_TMP_SEARCH=$(cat "$LIV_DIR_SCRIPT_CUR/resources/php/php-search.ini")
LIV_TMP_REPLACE=$(cat "$LIV_DIR_SCRIPT_CUR/resources/php/php-replace.ini")
liv_sed_replace "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/php5/apache2/php.ini

# This config file applies to CLI only, not for HTTP
liv_sed_replace "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/php5/cli/php.ini

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
