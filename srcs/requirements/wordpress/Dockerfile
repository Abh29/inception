FROM debian:buster

RUN apt-get update && apt-get -y install \
    php7.3 php7.3-cli php7.3-fpm \
    php7.3-mysql wget gettext 

RUN wget http://wordpress.org/latest.tar.gz

RUN mkdir -p /var/www/mehill.42.fr/html
RUN chown -R www-data:www-data /var/www/mehill.42.fr
RUN chmod -R g+rwX /var/www/mehill.42.fr

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./conf/wp-config.php /root/wp-config.php
COPY ./tools/entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

EXPOSE  9000

ENTRYPOINT [ "bash", "/root/entrypoint.sh" ]
