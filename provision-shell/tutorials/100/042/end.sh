# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ $(liv_package_installed 'php5-xdebug') = '0' ]; then
    # Install XDebug package
    sudo apt-get -y install php5-xdebug > /dev/null 2>&1

    # "zend_extension" php.ini value
    LIV_TMP_PATH=$(sudo find / -name xdebug.so)

    LIV_TMP_SEARCH=$(cat "$LIV_DIR_SCRIPT_CUR/resources/php/php-search.ini")
    LIV_TMP_REPLACE=$(cat "$LIV_DIR_SCRIPT_CUR/resources/php/php-replace.ini")
    eval "LIV_TMP_REPLACE=\"$LIV_TMP_REPLACE\""
    liv_sed_insert_after_once "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/php5/apache2/php.ini

    # Restart Apache to make these changes take effect
    sudo service apache2 restart > /dev/null 2>&1
fi
