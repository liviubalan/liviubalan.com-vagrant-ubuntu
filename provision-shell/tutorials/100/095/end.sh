# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Create directory structure
mkdir /var/www/http.liviubalan.com-8000 > /dev/null 2>&1

# Clean directory
rm -rf /var/www/http.liviubalan.com-8000/*

# Create index.html
cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com-8000/html/index.html" /var/www/http.liviubalan.com-8000/

# Create virtual host files
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com-8000/apache/http.liviubalan.com-8000.conf" /etc/apache2/sites-available/

# Enable the new virtual host files
sudo a2ensite http.liviubalan.com-8000.conf > /dev/null 2>&1

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
