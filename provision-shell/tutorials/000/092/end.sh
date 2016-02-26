# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Set up Apache WP virtual host
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/http.liviubalan.com.conf" /etc/apache2/sites-available/

# Create Apache error HTML.
# In order to see the output use the following URLs into your browser:
# http://http.liviubalan.com/protected-file.txt followed by "Esc" key or "Cancel" button - 401.html
# http://http.liviubalan.com/page-not-found - 404.html
mkdir /var/www/http.liviubalan.com/apache-errors > /dev/null 2>&1
cp -r "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/html/." /var/www/http.liviubalan.com/apache-errors/
touch /var/www/http.liviubalan.com/protected-file.txt

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
