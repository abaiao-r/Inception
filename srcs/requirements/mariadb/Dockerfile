# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 14:12:33 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/09 16:22:49 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the penultimate stable version of Debian
FROM debian:bullseye

# Update and install MariaDB
RUN apt-get update && apt-get install -y mariadb mariadb-client && rm -rf /var/lib/apt/lists/*

# Copy MariaDB configuration files
COPY conf/configure.sh /usr/local/bin/configure.sh

# Change permissions of the script and execute it
RUN chmod +x /usr/local/bin/configure.sh

# Expose port 3306 for MySQL
EXPOSE 3306

# Command to run MariaDB
CMD ["sh", "-c", "/usr/local/bin/configure.sh && exec mysqld --user=mysql --console"]
#ENTRYPOINT ["mysqld", "--user=mysql", "--console"]