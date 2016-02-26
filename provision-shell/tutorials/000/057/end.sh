# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Activate Apache mod_rewrite module
sudo a2enmod rewrite > /dev/null 2>&1

# Set up Apache WP virtual host
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/http.liviubalan.com.conf" /etc/apache2/sites-available/

# Project resources
cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/html/apples.html" /var/www/http.liviubalan.com/
cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/.htaccess" /var/www/http.liviubalan.com/

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
