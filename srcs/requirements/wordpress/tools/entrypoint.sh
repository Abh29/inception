#!/bin/sh

set -e

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ -e latest.tar.gz ]; then
    
    tar -xvf latest.tar.gz -C /var/www/html --strip-components=1
    mv /root/wp-config.php /var/www/html/

#    envsubst < /root/wp-config.php > /var/www/html/wp-config.php 

    rm latest.tar.gz

fi

# service php7.3-fpm start
# sleep 3
# service php7.3-fpm stop

# php-fpm7.3 -F

exec php-fpm7.3 -F
