#!/bin/bash

if [ ! -e /etc/ssl/certs/ca.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ca.key -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/CN=mehill/emailAddress=mehill@student.21-school.ru" -out /etc/ssl/certs/ca.crt
    echo "ssl cert added"
fi

nginx -g "daemon off;" 

##exec "$@"