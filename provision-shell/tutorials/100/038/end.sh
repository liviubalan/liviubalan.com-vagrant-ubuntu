# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# This config file applies to HTTP only, not for CLI
sudo sed -i 's/^\;date\.timezone \=$/date\.timezone \= "Europe\/Bucharest"/g' /etc/php5/apache2/php.ini

# This config file applies to CLI only, not for HTTP
sudo sed -i 's/^\;date\.timezone \=$/date\.timezone \= "Europe\/Bucharest"/g' /etc/php5/cli/php.ini

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
