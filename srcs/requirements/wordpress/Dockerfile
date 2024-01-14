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

# Use the penultimate stable version of Debian
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

# Copy WordPress configuration file
COPY srcs/requirements/wordpress/wp-config.php /wordpress

# Expose port for php-fpm
EXPOSE 9000

# Command to run php-fpm in the foreground
CMD ["php-fpm7.4", "-F"]

