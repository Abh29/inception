FROM    debian:buster

# RUN	apt-get update && apt-get upgrade && apt-get install -y \
#         gettext vsftpd db-util


# COPY    conf/vsftpd.conf /etc/vsftpd/
# COPY    conf/vsftpd_virtual /etc/pam.d/
# COPY    tools/run-vsftpd.sh /usr/sbin/

# RUN     chmod +x /usr/sbin/run-vsftpd.sh
# RUN     mkdir -p /home/vsftpd/
# RUN     chown -R ftp:ftp /home/vsftpd/

# RUN     mkdir -p /var/www/mehill.42.fr/html

# # ENTRYPOINT ["sh", "/tmp/configure.sh"]

# EXPOSE 20 21

# # CMD [ "bash" "/usr/sbin/run-vsftpd.sh" ]

# CMD [ "bash" ]


RUN apt-get update \
    && apt-get install -y --no-install-recommends vsftpd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty \
 && mkdir -p /etc/vsftpd \
 && mkdir -p /var/www/mehill.42.fr/html \
 && mv /etc/vsftpd.conf /etc/vsftpd.conf.back

COPY tools/vsftpd.sh    .

EXPOSE 20-21
EXPOSE 21100-21110

ENTRYPOINT [ "bash", "./vsftpd.sh" ]

# CMD [ "bash" ]