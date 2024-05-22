#!/bin/sh

mkdir -p $CRT_PATH

openssl req -x509 -newkey rsa:4096 -keyout $CRT_PATH/cert.key -out $CRT_PATH/cert.crt -days 365 -nodes -subj "/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=leetinitiative"

sed -i "s|cert_path|$CRT_PATH|g" /etc/nginx/http.d/wordpress.conf
sed -i "s|HOSTNAME|$HOSTNAME|g" /etc/nginx/http.d/wordpress.conf

exec nginx -g "daemon off;"