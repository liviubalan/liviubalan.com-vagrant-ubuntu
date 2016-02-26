# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

sudo useradd -m -s /bin/bash -g www-data -c "$LIV_USR_WWW_NAME" "$LIV_USR_WWW_USER" > /dev/null 2>&1
sudo bash -c "echo '$LIV_USR_WWW_USER:$LIV_USR_WWW_PWD' | chpasswd" > /dev/null 2>&1
