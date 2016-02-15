# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Include some helper packages
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt > /dev/null 2>&1

# Tell our web server to prefer PHP files
LIV_TMP_SEARCH=$(cat "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/dir-search.conf")
LIV_TMP_REPLACE=$(cat "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/dir-replace.conf")
liv_sed_replace "$LIV_TMP_SEARCH" "$LIV_TMP_REPLACE" /etc/apache2/mods-enabled/dir.conf

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1

# Test PHP installation
rm -rf /var/www/http.liviubalan.com/*
cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/php/index.php" /var/www/http.liviubalan.com/
