# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# PHP scripts used
cp -r "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/php/." /var/www/http.liviubalan.com/

# Keep only current tutorial PHP files
mv /var/www/http.liviubalan.com/apc_cache_info.php /var/www/http.liviubalan.com/apc/ > /dev/null 2>&1
mv /var/www/http.liviubalan.com/apc_clear_cache.php /var/www/http.liviubalan.com/apc/ > /dev/null 2>&1
mv /var/www/http.liviubalan.com/apc_fetch.php /var/www/http.liviubalan.com/apc/ > /dev/null 2>&1
mv /var/www/http.liviubalan.com/apc_sma_info.php /var/www/http.liviubalan.com/apc/ > /dev/null 2>&1
mv /var/www/http.liviubalan.com/apc_store.php /var/www/http.liviubalan.com/apc/ > /dev/null 2>&1
