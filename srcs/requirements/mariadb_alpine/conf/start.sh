

/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

# -> Startup MySQL database
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS \`wp_db\`;"
mysql -e "CREATE USER IF NOT EXISTS \`mehill\`@'localhost' IDENTIFIED BY 'secret';"
mysql -e "GRANT ALL PRIVILEGES ON \`wp_db\`.* TO \`mehill\`@'%' IDENTIFIED BY 'secret';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootsecret';"
mysql -e "FLUSH PRIVILEGES;"

# -> Shutdown MySQL database and start it again
pkill mysqld
sleep 1
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql