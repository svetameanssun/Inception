#!/bin/bash

# Wait for MariaDB to be ready
echo "Waiting MariaDB..."
while ! mariadb -h mariadb -u "${SQL_USER}" -p${SQL_PASSWORD} -e "SELECT 1" > /dev/null 2>&1; do
    sleep 2
done
echo "MariaDB is ready!"

#cd /var/www/html/wordpress

# Download WordPress if it doesn't exist
# if [ ! -f wp-config.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
    
    echo "Configuring WordPress..."
    wp config create \
        --dbname=${SQL_DATABASE} \
        --dbuser=${SQL_USER} \
        --dbpass=${SQL_PASSWORD} \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=https://${WP_URL} \
        --title=${WP_TITLE} \
        --admin_user=${WP_ADMIN_USR} \
        --admin_password=${WP_ADMIN_PWD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root

    # Create second user (not admin)
    wp user create "${WP_USR}" "${WP_EMAIL}" \
        --role=author \
        --user_pass=${WP_PWD} \
        --allow-root
    
    echo "WordPress is ready!"
# else
#     echo "WordPress is already configured."
# fi

# Run PHP-FPM in the foreground
php-fpm8.2 -F