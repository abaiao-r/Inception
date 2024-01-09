# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 15:05:28 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/03 15:06:44 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the penultimate stable version of Debian
FROM debian:bullseye

# Update and install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy Nginx configuration files
COPY srcs/requirements/nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for TLS
EXPOSE 443

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
