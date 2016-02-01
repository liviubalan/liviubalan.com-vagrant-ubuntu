# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Change "www" directory owner and mode bits in order to be accessed by users from the "www-data" group
sudo chown www-data:www-data /var/www/
sudo chmod 775 /var/www/

# Run commands as other user with default group "www-data"
# Create directory structure
sudo -H -u liviu.balan bash -c 'mkdir /var/www/http.liviubalan.com > /dev/null 2>&1'
sudo -H -u liviu.balan bash -c 'mkdir /var/www/liviubalan.ro > /dev/null 2>&1'

# Create index.html
sudo -H -u liviu.balan bash -c "cp $LIV_DIR_SCRIPT_CUR/resources/html/http.liviubalan.com/index.html /var/www/http.liviubalan.com/"
sudo -H -u liviu.balan bash -c "cp $LIV_DIR_SCRIPT_CUR/resources/html/liviubalan.ro/index.html /var/www/liviubalan.ro/"

# Create virtual host files
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/conf/http.liviubalan.com.conf" /etc/apache2/sites-available/http.liviubalan.com.conf
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/conf/liviubalan.ro.conf" /etc/apache2/sites-available/liviubalan.ro.conf

# Enable the new virtual host files
sudo a2ensite http.liviubalan.com.conf > /dev/null 2>&1
sudo a2ensite liviubalan.ro.conf > /dev/null 2>&1

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
