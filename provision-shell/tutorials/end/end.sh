# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# This shell script is run after all the tutorials
# Here are the cleanup, service restart, delete temporary data, etc

# Restart SSH service
sudo service ssh restart > /dev/null 2>&1
