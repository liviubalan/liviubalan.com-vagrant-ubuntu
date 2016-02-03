# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

sudo bash -c "echo mysql-server mysql-server/root_password password $LIV_USR_MYSQL_ROOT_PWD | debconf-set-selections"
sudo bash -c "echo mysql-server mysql-server/root_password_again password $LIV_USR_MYSQL_ROOT_PWD | debconf-set-selections"
sudo apt-get -y install mysql-server > /dev/null 2>&1
