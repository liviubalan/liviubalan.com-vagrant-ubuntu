# This shell script is run after all the tutorials
# Here are the cleanup, service restart, delete temporary data, etc

# Restart SSH service
sudo service ssh restart > /dev/null 2>&1
