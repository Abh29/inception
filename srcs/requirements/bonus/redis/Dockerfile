FROM    debian:buster

LABEL   author="mehill"

RUN     apt update && apt upgrade && apt install -y \
        gettext redis-server

COPY    config/redis.conf   /etc/redis/redis.conf

EXPOSE  6379

CMD [ "redis-server", "/etc/redis/redis.conf" ]
