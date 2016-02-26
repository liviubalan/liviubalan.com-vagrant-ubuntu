# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Utility programs for webservers
sudo apt-get -y install apache2-utils > /dev/null 2>&1

# Manage user files for basic authentication
# -c Create the passwdfile. If passwdfile already exists, it is rewritten and truncated.
# Use -c option first time when creating passwdfile.
# -b Use batch mode; i.e., get the password from the command line rather than prompting for it
sudo htpasswd -b -c /etc/apache2/.htpasswd "$LIV_USR_HTTP_USER1" "$LIV_USR_HTTP_PWD1" > /dev/null 2>&1
sudo htpasswd -b /etc/apache2/.htpasswd "$LIV_USR_HTTP_USER2" "$LIV_USR_HTTP_PWD2" > /dev/null 2>&1

# Set up Apache WP virtual host
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/wp.liviubalan.com/apache/wp.liviubalan.com.conf" /etc/apache2/sites-available/

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
