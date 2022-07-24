FROM    debian:buster

LABEL   author="mehill"

RUN     apt update && apt upgrade && apt install -y \
        gettext vsftpd db-util

RUN     mkdir -p /etc/vsftpd/

COPY    conf/vsftpd.conf /home/
COPY    conf/vsftpd_virtual /etc/pam.d/
COPY    tools/entrypoint.sh /usr/sbin/

RUN     chmod +x /usr/sbin/entrypoint.sh
RUN     mkdir -p /home/vsftpd/mehill
RUN     chown -R ftp:ftp /home/vsftpd/

# VOLUME /home/vsftpd/mehill
# VOLUME /var/log/vsftpd

EXPOSE 20 21

ENTRYPOINT [ "bash" ,"/usr/sbin/entrypoint.sh" ]

#CMD [ "bash" ]