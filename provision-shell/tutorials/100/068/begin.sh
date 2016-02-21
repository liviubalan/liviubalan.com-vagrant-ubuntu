# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ ! -e /var/www/http.liviubalan.com/file-1.txt ]; then
    cd /var/www/http.liviubalan.com/

    # Add and commit all project files
    git add .
    git commit -m 'Initial commit' > /dev/null 2>&1

    touch /var/www/http.liviubalan.com/file-1.txt
    touch /var/www/http.liviubalan.com/file-2.txt

    git add .
    git commit -m 'Create file-1.txt and file-2.txt' > /dev/null 2>&1
fi
