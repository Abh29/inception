FROM    debian:buster

RUN     apt update && apt upgrade && apt install -y \
        mosquitto mosquitto-clients

COPY    tools/entrypoint.sh    .
COPY    conf/default.conf   /etc/mosquitto/conf.d/default.conf

EXPOSE  1883

ENTRYPOINT [ "bash", "./entrypoint.sh" ]
