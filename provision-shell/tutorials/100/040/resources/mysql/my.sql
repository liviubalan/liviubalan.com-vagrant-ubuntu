# Make a new user
CREATE USER '$LIV_USR_MYSQL_USR_USR'@'localhost' IDENTIFIED BY '$LIV_USR_MYSQL_USR_PWD';
 
# Allow the user to read, edit, execute and perform all tasks across all the databases and tables
GRANT ALL PRIVILEGES ON * . * TO '$LIV_USR_MYSQL_USR_USR'@'localhost';
 
# Reload all the privileges
FLUSH PRIVILEGES;