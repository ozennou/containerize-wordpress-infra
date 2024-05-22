#!/bin/bash

adduser --disabled-password --home /data $FTP_USER

echo $FTP_USER:$FTP_PASSWD | chpasswd

#https://stackoverflow.com/questions/1699145/what-is-the-difference-between-active-and-passive-ftp
echo "
write_enable=YES
pasv_enable=YES
pasv_min_port=10000
pasv_max_port=10100" >> /etc/vsftpd.conf

mkdir -p /var/run/vsftpd/empty

exec /usr/sbin/vsftpd /etc/vsftpd.conf