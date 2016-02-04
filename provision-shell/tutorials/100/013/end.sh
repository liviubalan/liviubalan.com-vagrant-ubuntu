# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

sudo apt-get -y install apache2 > /dev/null 2>&1

# Create Apache2 shared directory and point "/var/www/" to it
if [ ! -d "$LIV_DIR_SHR_APACHE" ]; then
    mkdir "$LIV_DIR_SHR_APACHE"
    sudo mv /var/www/html/ "$LIV_DIR_SHR_APACHE/"
    sudo rm -rf /var/www/
    sudo ln -s "$LIV_DIR_SHR_APACHE" /var/www
fi
