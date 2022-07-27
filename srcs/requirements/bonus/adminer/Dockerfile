FROM debian:buster

RUN apt-get update && apt-get -y install \
    php7.3 php7.3-cli php7.3-fpm \
    php7.3-mysql wget 

RUN mkdir -p /var/www/adminer.42.fr/html
RUN chown -R www-data:www-data /var/www/*
RUN chown -R 755 /var/www/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

EXPOSE  9000

ENTRYPOINT [ "bash", "/root/entrypoint.sh" ]
