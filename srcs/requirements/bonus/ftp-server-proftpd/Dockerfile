FROM    debian:buster

LABEL   author="mehill"

# RUN     apt update && apt upgrade && apt install -y \
#         gettext vsftpd db-util

RUN     mkdir -p /var/www/mehill.42.fr/html

# COPY    conf/vsftpd.conf /home/
# COPY    conf/vsftpd_virtual /etc/pam.d/
# COPY    tools/entrypoint.sh /usr/sbin/

# RUN     chmod +x /usr/sbin/entrypoint.sh
# RUN     mkdir -p /home/vsftpd/mehill
# RUN     chown -R ftp:ftp /home/vsftpd/


# EXPOSE 20 21

# ENTRYPOINT [ "bash" ,"/usr/sbin/entrypoint.sh" ]


RUN     apt-get update && apt-get upgrade && apt-get install -y \
        gettext proftpd


COPY    conf/proftpd.conf       .
COPY    tools/entrypoint.sh     .

EXPOSE 20 21

# ENTRYPOINT ["bash", "./entrypoint.sh"]

#CMD ["proftpd", "--nodaemon"]

 CMD     [ "bash" ]