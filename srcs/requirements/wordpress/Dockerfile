# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 15:06:57 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/09 19:05:44 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Dockerfile
FROM debian:buster

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-gd \
    php7.3-imagick \
    php7.3-dev \
    php7.3-curl \
    php7.3-opcache \
    php7.3-cli \
    php7.3-sqlite \
    php7.3-intl \
    php7.3-tidy \
    php7.3-imap \
    php7.3-json \
    php7.3-pspell \
    php7.3-common \
    php7.3-sybase \
    php7.3-sqlite3 \
    php7.3-bz2 \
    php7.3-common \
    php7.3-apcu-bc \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Change PHP-FPM to listen on port 9000 instead of a Unix socket
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Create the /run/php/ directory
RUN mkdir -p /run/php/

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz

# Create /var/www/html/ directory
RUN mkdir -p /var/www/html/

# Move WordPress to /var/www/html/
RUN mv wordpress /var/www/html/

# Copy WordPress configuration file
COPY ./conf/wp-config.php /var/www/html/wordpress
COPY ./conf/wp-config.php /var/www/html/wp-config.php


# Expose port for php-fpm
EXPOSE 9000

# Command to run php-fpm in the foreground
CMD ["php-fpm7.3", "-F"]
#ENTRYPOINT ["sh", "-c", "sleep 2073600"]