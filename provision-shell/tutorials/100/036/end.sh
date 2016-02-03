# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Include some helper packages
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt > /dev/null 2>&1

# Tell our web server to prefer PHP files
sudo sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1

# Test PHP installation
rm -rf /var/www/http.liviubalan.com/*
cp "$LIV_DIR_SCRIPT_CUR/resources/php/http.liviubalan.com/index.php" /var/www/http.liviubalan.com/
