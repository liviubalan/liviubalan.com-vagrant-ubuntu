# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Apache Hide PHP Version header (X-Powered-By)
LIV_TMP_SEARCH=$(cat "$LIV_DIR_SCRIPT_CUR/resources/php/php-search.ini")
LIV_TMP_REPLACE=$(cat "$LIV_DIR_SCRIPT_CUR/resources/php/php-replace.ini")
liv_sed_replace "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/php5/apache2/php.ini

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1

if [ ! -e /var/www/wp.liviubalan.com//phpinfo.php ]; then
    cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/php/index.php" /var/www/http.liviubalan.com/
    cd /var/www/http.liviubalan.com/
    git add .
    git commit -m 'Change index.php: only phpinfo function' > /dev/null 2>&1

    cp "$LIV_DIR_SCRIPT_CUR/resources/wp.liviubalan.com/php/phpinfo.php" /var/www/wp.liviubalan.com/
fi
