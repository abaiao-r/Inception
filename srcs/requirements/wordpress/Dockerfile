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
    php-fpm \
    php-mysql \
    wget && \
    rm -rf /var/lib/apt/lists/*

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
