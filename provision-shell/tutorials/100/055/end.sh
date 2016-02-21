# (c) Liviu Balan <liv_romania@yahoo.com>
# http://www.liviubalan.com/
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# Create directory structure
mkdir /var/www/wp.liviubalan.com > /dev/null 2>&1

# Clean directory
rm -rf /var/www/wp.liviubalan.com/*

# Set up Apache WP virtual host
sudo cp "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/apache/wp.liviubalan.com.conf" /etc/apache2/sites-available/

# Enable the new virtual host files
sudo a2ensite wp.liviubalan.com.conf > /dev/null 2>&1

# Restart Apache to make these changes take effect
sudo service apache2 restart > /dev/null 2>&1

# [Re]Create WordPress database
LIV_TMP=$(cat "$LIV_DIR_SCRIPT_CUR/resources/http.liviubalan.com/mysql/wp.liviubalan.com.sql")
eval "LIV_TMP=\"$LIV_TMP\""
mysql -u root "-p$LIV_USR_MYSQL_ROOT_PWD" -e "$LIV_TMP" > /dev/null 2>&1

# Install WP-CLI
wget -O ~/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1

# Use "wp" command instead of "php wp-cli.phar"
chmod +x ~/wp-cli.phar
sudo mv ~/wp-cli.phar /usr/local/bin/wp

# Tab completions
wget -O ~/.wp-completion.bash https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash > /dev/null 2>&1
LIV_TMP=$(cat "$LIV_DIR_SCRIPT_CUR/resources/vagrant/bash/.bash_profile")
echo "$LIV_TMP" > ~/.bash_profile

cd /var/www/wp.liviubalan.com/

# Download core WordPress files
wp core download > /dev/null 2>&1

# Generate a wp-config.php file
wp core config --dbname="$LIV_MYSQL_DB_WP" --dbuser="$LIV_USR_MYSQL_USR_USR" --dbpass="$LIV_USR_MYSQL_USR_PWD" --dbhost="localhost" > /dev/null 2>&1

# Create the WordPress tables in the database
wp core install --url="http://wp.liviubalan.com" --title="Liviu Balan WP" --admin_user="$LIV_USR_WP_USR" --admin_password="$LIV_USR_WP_PWD" --admin_email="$LIV_USR_WP_MAIL" --skip-email > /dev/null 2>&1
