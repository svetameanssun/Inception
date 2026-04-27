FROM debian:12

RUN apt-get update

RUN apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-xml \
    php-mbstring \
    wget \
    mariadb-client

RUN rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create directory
RUN mkdir -p /var/www/html/wordpress

# Copy PHP-FPM configuration
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Copy start script
COPY tools/wp.sh /wp.sh

# Give execution permissions to the script
RUN chmod +x /wp.sh

# Run the script when the container starts
CMD ["/.sh"]

