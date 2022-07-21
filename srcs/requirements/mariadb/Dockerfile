FROM debian:buster

LABEL author="mehill"

RUN apt update && apt upgrade

RUN apt install -y mariadb-server gettext

RUN rm -f /etc/my.cnf.d/mariadb-server.cnf && rm -f /etc/my.cnf.d/my.cnf
COPY conf/my.cnf /etc/my.cnf.d/my.cnf
COPY conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/db_init.sql .
COPY ./tools/entrypoint.sh .
COPY conf/debian.cnf .

RUN mkdir -p /run/mysqld /var/lib/mysql && chown -R mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT [ "bash", "./entrypoint.sh"]

