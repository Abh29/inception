#!/bin/bash

mkdir -p "/home/vsftpd/${FTP_USER}"
adduser ${FTP_USER} --disabled-password
echo "${FTP_USER}:${FTP_USER}" | /usr/sbin/chpasswd &> /dev/null
chown -R ${FTP_USER}:${FTP_USER} /home/vsftpd/

# mkdir -p /var/run/vsftpd/empty
# chown -R ftp:ftp /var/run/vsftpd/empty

echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd/virtual_users.txt
db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

# Set passive mode parameters:
if [ "$PASV_ADDRESS" = "**IPv4**" ]; then
    export PASV_ADDRESS=$(/sbin/ip route|awk '/default/ { print $3 }')
fi

envsubst < /home/vsftpd.conf > /etc/vsftpd/vsftpd.conf

# Get log file path
export LOG_FILE=`grep xferlog_file /etc/vsftpd/vsftpd.conf|cut -d= -f2`

# stdout server info:
if [ ! $LOG_STDOUT ]; then
cat << EOB
	SERVER SETTINGS
	---------------
	· FTP User: $FTP_USER
	· FTP Password: $FTP_PASS
	· Log file: $LOG_FILE
	· Redirect vsftpd log to STDOUT: No.
EOB
else
    ln -sf /dev/stdout $LOG_FILE
fi

# Run vsftpd:
vsftpd /etc/vsftpd/vsftpd.conf

