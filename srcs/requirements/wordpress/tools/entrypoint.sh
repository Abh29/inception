#!/bin/sh

set -e

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -e /var/www/mehill.42.fr/html/wp-config.php ]; then
    
    tar -xvf latest.tar.gz -C /var/www/mehill.42.fr/html --strip-components=1

    envsubst < /root/wp-config.php | head -n 43 > /var/www/mehill.42.fr/html/wp-config.php
    tail -n +43 /root/wp-config.php >> /var/www/mehill.42.fr/html/wp-config.php

    rm latest.tar.gz

fi

chown -R www-data:www-data /var/www/mehill.42.fr
chmod -R g+rwX /var/www/mehill.42.fr

exec php-fpm7.3 -F
