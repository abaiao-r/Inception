# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 15:05:28 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/16 14:45:46 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the penultimate stable version of Debian
FROM debian:bullseye

# Update and install Nginx
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# create a folder for the SSL certificate and private key and then create a 
#self-signed SSL certificate and private key in that folder
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisbon/OU=abaiao-r/CN=abaiao-r" \
    -keyout /etc/nginx/ssl/abaiao-r.key \
    -out /etc/nginx/ssl/abaiao-r.crt

# Copy Nginx configuration files
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Expose port 443 for HTTPS
EXPOSE 443

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
