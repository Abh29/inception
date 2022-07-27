#!/bin/sh

set -e

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -e /var/www/adminer.42.fr/html/index.php ]; then
    wget "http://www.adminer.org/latest.php" -O /var/www/adminer.42.fr/html/index.php
fi

exec php-fpm7.3 -F
