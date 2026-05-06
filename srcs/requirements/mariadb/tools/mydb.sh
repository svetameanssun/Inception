#!/bin/bash

mysqld_safe &

#service mariadb start
sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"


mysqladmin shutdown

mysqld_safe
# mariadb -u root
