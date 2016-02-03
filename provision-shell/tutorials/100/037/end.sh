# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Resolve AH00558 error on service apache2 restart
if ! grep -q '^ServerName localhost$' /etc/apache2/apache2.conf ; then
    echo "test"
    sudo bash -c "cat $LIV_DIR_SCRIPT_CUR/resources/apache2.conf >> /etc/apache2/apache2.conf"
fi

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1
