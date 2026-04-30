#!/bin/bash

mysqld_safe &

#service mariadb start
sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"


mysqladmin shutdown

mysqld_safe
# mariadb -u root
