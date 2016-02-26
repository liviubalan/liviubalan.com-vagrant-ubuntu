# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ $(liv_package_installed 'php-apc') = '0' ]; then
    # Install APC module
    sudo apt-get -y install php-apc > /dev/null 2>&1

    # Restart Apache to make these changes take effect
    sudo service apache2 restart > /dev/null 2>&1
fi
