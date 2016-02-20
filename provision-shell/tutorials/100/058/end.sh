# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

cd /var/www/wp.liviubalan.com/

# Update an option
wp option update 'permalink_structure' '/%postname%/'
