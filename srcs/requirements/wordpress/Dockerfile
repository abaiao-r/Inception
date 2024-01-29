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
FROM debian:bullseye

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    bash \
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

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY ./tools/wordpress.sh /usr/wordpress.sh
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html

# Expose port for php-fpm
EXPOSE 9000

# Command to run php-fpm in the foreground
CMD ["/usr/sbin/php-fpm7.3", "-F"]