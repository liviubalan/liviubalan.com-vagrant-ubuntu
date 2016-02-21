# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Clean "/var/www/http.liviubalan.com/" directory
rm -rf /var/www/http.liviubalan.com/apples.html
rm -rf /var/www/http.liviubalan.com/.htaccess
rm -rf /var/www/http.liviubalan.com/.git

cd /var/www/http.liviubalan.com/

# Create an empty Git repository
git init > /dev/null 2>&1
