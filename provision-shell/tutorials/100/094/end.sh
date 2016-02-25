# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# a2ensite, a2dissite - enable or disable an Apache2 site / virtual host
sudo a2dissite liviubalan.ro > /dev/null 2>&1

# Remove virtual host document root directory
rm -rf /var/www/liviubalan.ro/

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
