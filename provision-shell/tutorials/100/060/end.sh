# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Changes to .bashrc are user specific
LIV_TMP=$(cat "$LIV_DIR_SCRIPT_CUR/resources/vagrant/bash/.bashrc")
liv_sed_remove_comment_line "$LIV_TMP" '#' ~/.bashrc

# .bashrc at ssh login
# For more info see http://stackoverflow.com/questions/820517/bashrc-at-ssh-login
LIV_TMP=$(cat "$LIV_DIR_SCRIPT_CUR/resources/vagrant/bash/.bash_profile")
liv_sed_insert_end_once "$LIV_TMP" ~/.bash_profile
