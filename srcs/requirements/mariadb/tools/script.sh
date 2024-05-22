#!/bin/sh

#https://mariadb.com/kb/en/mariadb-install-db/

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

#mariadbd alias for mysqld (mysql server)
#https://unix.stackexchange.com/questions/58655/turn-off-skip-grant-tables-in-mysql

mariadbd --user=mysql --datadir=/var/lib/mysql --bootstrap << EOF

FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS $DB_NAME;

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';

GRANT ALL PRIVILEGES ON *.* to '$DB_USER'@'%';

FLUSH PRIVILEGES;

EOF

exec mariadbd-safe --datadir=/var/lib/mysql