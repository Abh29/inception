#!/bin/bash

set -e

mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

if [ ! -e /var/lib/mysql/wp_db ]; then

    service mysql start

    envsubst < db_init.sql | mysql

    envsubst < debian.cnf > /etc/mysql/debian.cnf

    service mysql stop

    sleep 3

fi

mysqld
