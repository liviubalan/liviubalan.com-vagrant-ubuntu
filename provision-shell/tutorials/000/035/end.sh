# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Install some other "helper" packages that will assist us in getting our components to communicate with each other
sudo bash -c "echo mysql-server mysql-server/root_password password $LIV_USR_MYSQL_ROOT_PWD | debconf-set-selections"
sudo bash -c "echo mysql-server mysql-server/root_password_again password $LIV_USR_MYSQL_ROOT_PWD | debconf-set-selections"
sudo apt-get -y install mysql-server php5-mysql > /dev/null 2>&1
