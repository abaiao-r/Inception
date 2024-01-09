# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/09 15:39:38 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/09 15:48:21 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Start the MariaDB server
service mysql start

# Create a new database
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# Create a new user and grant privileges
mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Create a second user (admin) and grant privileges
mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"

# Flush privileges
mysql -e "FLUSH PRIVILEGES;"
