#!/bin/bash

mysqld_safe &

#service mariadb start
sleep 5

#mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
#mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
#mysql -e "FLUSH PRIVILEGES;"
# 3. Выполняем настройку
# Используем root пароль, если он задан
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"

# Устанавливаем или обновляем пароль root (важно для защиты)
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# 4. Выключаем временный процесс
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown


#mysqladmin shutdown

mysqld_safe
# mariadb -u root
