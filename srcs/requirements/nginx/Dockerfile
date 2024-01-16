# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 15:05:28 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/16 13:39:11 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the penultimate stable version of Debian
FROM debian:bullseye

# Update and install Nginx
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*  && \
    rm /etc/nginx/sites-enabled/default

# Copy the script into the image
COPY generate-certificate.sh /generate-certificate.sh

# Make the script executable and run it
RUN chmod +x /generate-certificate.sh && /generate-certificate.sh

# Copy Nginx configuration files
COPY srcs/requirements/nginx/nginx.conf /etc/nginx/sites-enabled/

# Copy SSL certificate files and private key
#COPY srcs/requirements/nginx/localhost.crt /etc/ssl/certs/
#COPY srcs/requirements/nginx/localhost.key /etc/ssl/private/

# Expose port 443 for HTTPS
EXPOSE 443

# Command to run Nginx in the foreground
CMD /generate-certificate.sh && exec nginx -g 'daemon off;'
