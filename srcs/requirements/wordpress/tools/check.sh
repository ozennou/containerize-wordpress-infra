#!/bin/sh

if netstat -tl | grep -q ':9000' ;then
    echo "php-fpm81 listening on port 9000"
    exit 0
else
    echo "php-fpm81 not listening on port 9000"
    exit 1
fi