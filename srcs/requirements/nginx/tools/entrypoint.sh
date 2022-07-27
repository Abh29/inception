#!/bin/bash

ln -sf /etc/nginx/sites-available/mehill.42.fr /etc/nginx/sites-enabled
ln -sf /etc/nginx/sites-available/adminer.42.fr /etc/nginx/sites-enabled
ln -sf /etc/nginx/sites-available/mycv.42.fr /etc/nginx/sites-enabled

if [ ! -e /etc/ssl/certs/ca.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ca.key -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/CN=mehill/emailAddress=mehill@student.21-school.ru" -out /etc/ssl/certs/ca.crt
    echo "ssl cert added"
fi

nginx -g "daemon off;" 

##exec "$@"