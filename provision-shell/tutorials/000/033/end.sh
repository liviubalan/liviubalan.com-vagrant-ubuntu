# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Change "www" directory owner and mode bits in order to be accessed by users from the "www-data" group.
# Because "/var/www/" points to a Vagrant shared directory changing the file owner do not apply
#sudo chown www-data:www-data /var/www/
#sudo chmod 775 /var/www/

# Create directory structure
mkdir /var/www/http.liviubalan.com > /dev/null 2>&1
mkdir /var/www/liviubalan.ro > /dev/null 2>&1

# Clean directories
rm -rf /var/www/http.liviubalan.com/*
rm -rf /var/www/liviubalan.ro/*

# Create index.html
cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/html/index.html" /var/www/http.liviubalan.com/
cp "$LIV_DIR_SCRIPT_CUR/resources/liviubalan.ro/html/index.html" /var/www/liviubalan.ro/

# Create virtual host files
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/http.liviubalan.com.conf" /etc/apache2/sites-available/
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/liviubalan.ro/apache/liviubalan.ro.conf" /etc/apache2/sites-available/

# Enable the new virtual host files
sudo a2ensite http.liviubalan.com.conf > /dev/null 2>&1
sudo a2ensite liviubalan.ro.conf > /dev/null 2>&1

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
