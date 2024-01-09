# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 15:06:57 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/03 15:11:44 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the penultimate stable version of Debian
FROM debian:bullseye

# Update and install WordPress dependencies
RUN apt-get update && apt-get install -y php-fpm php-mysql php-json php-openssl php-curl php-zip && rm -rf /var/lib/apt/lists/*

# Copy WordPress configuration files
COPY WordPress /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Command to run PHP-FPM
CMD ["php-fpm7.3", "-F"]