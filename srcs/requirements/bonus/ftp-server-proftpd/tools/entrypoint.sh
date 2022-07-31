# #!/bin/bash

# adduser ${FTP_USER} --disabled-password --quiet
# echo "${FTP_USER}:${FTP_USER}" | chpasswd &> /dev/null
# chown -R ${FTP_USER}:${FTP_USER} /var/www/mehill.42.fr/html



# mkdir -p /var/run/vsftpd/empty

# echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd/virtual_users.txt
# db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

# # Set passive mode parameters:
# if [ "$PASV_ADDRESS" = "**IPv4**" ]; then
#     export PASV_ADDRESS=$(/sbin/ip route|awk '/default/ { print $3 }')
# fi

# envsubst < /home/vsftpd.conf > /etc/vsftpd/vsftpd.conf

# # Get log file path
# export LOG_FILE=`grep xferlog_file /etc/vsftpd/vsftpd.conf|cut -d= -f2`

# # stdout server info:
# cat << EOB
# 	SERVER SETTINGS
# 	---------------
# 	· FTP User: $FTP_USER
# 	· FTP Password: $FTP_PASS
# 	· Log file: $LOG_FILE
# 	· Redirect vsftpd log to STDOUT: No.
# EOB


# # Run vsftpd:
# vsftpd /etc/vsftpd/vsftpd.conf

CRYPTED_PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' $FTP_PASS)
echo "$CRYPTED_PASSWORD       $FTP_PASS"
useradd -d /var/www/mehill.42.fr/html -p $CRYPTED_PASSWORD $FTP_USER
chown -R "$FTP_USER:$FTP_USER" /var/www/mehill.42.fr/html
chmod -R 775 /var/www/mehill.42.fr/html

envsubst < proftpd.conf > /etc/proftpd/proftpd.conf


# #!/bin/bash

# if [ -n "$FTP_LIST" ]; then
# 	IFS=';' read -r -a parsed_ftp_list <<< "$FTP_LIST" ; unset IFS
# 	for ftp_account in ${parsed_ftp_list[@]}
# 	do
# 		IFS=':' read -r -a tab <<< "$ftp_account" ; unset IFS
# 		ftp_login=${tab[0]}
# 		ftp_pass=${tab[1]}
# 		CRYPTED_PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' $ftp_pass)
# 		useradd --shell /bin/sh ${USERADD_OPTIONS} -d /home/$ftp_login --password $CRYPTED_PASSWORD $ftp_login
#     echo "ftp_login: $ftp_login"
#     chown -R $ftp_login:$ftp_login /home/$ftp_login
# 	done
# fi

# if [[ -z "${PASSIVE_MIN_PORT}" ]]; then
#   PASV_MIN=50000
# else
#   PASV_MIN="${PASSIVE_MIN_PORT}"
# fi
# if [[ -z "${PASSIVE_MAX_PORT}" ]]; then
#   PASV_MAX=50100
# else
#   PASV_MAX="${PASSIVE_MAX_PORT}"
# fi
# sed -i "s/^\(# \)\?PassivePorts.*$/PassivePorts ${PASV_MIN} ${PASV_MAX}/" /etc/proftpd/proftpd.conf

# if [[ -z "${MASQUERADE_ADDRESS}" ]]; then
#   sed -i "s/^\(# \)\?MasqueradeAddress.*$/# MasqueradeAddress x.x.x.x/" /etc/proftpd/proftpd.conf
# else
#   sed -i "s/^\(# \)\?MasqueradeAddress.*$/MasqueradeAddress ${MASQUERADE_ADDRESS}/" /etc/proftpd/proftpd.conf
# fi

# exec "$@"

# proftpd --nodaemon