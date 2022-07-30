FROM debian:buster

LABEL author="mehill"

RUN apt-get update && apt-get install -y \
    nginx openssl

ENV PATH=/usr/local/nginx/bin:$PATH

RUN mkdir -p /var/www/mehill.42.fr/html \
    /var/www/adminer.42.fr/html \
    /var/www/mycv.42.fr/html \
    /var/www/jupyter.42.fr/html \
    /var/logs



COPY ./conf/mehill.42.fr    /etc/nginx/sites-available/mehill.42.fr
COPY ./conf/adminer.42.fr    /etc/nginx/sites-available/adminer.42.fr
COPY ./conf/mycv.42.fr    /etc/nginx/sites-available/mycv.42.fr
COPY ./tools/entrypoint.sh .

RUN chmod +x ./entrypoint.sh

EXPOSE 443

ENTRYPOINT [ "bash", "./entrypoint.sh" ]
