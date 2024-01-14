# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configure.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/09 15:39:38 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/14 17:56:41 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Start the MariaDB server
echo "Starting the MariaDB server..."
service mysql start
echo "MariaDB server started successfully."

# Create a new database
echo "Creating a new database: ${MYSQL_DATABASE}..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
echo "Database ${MYSQL_DATABASE} created successfully."

# Create a new user and grant privileges
echo "Creating a new user: ${MYSQL_USER}..."
mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "User ${MYSQL_USER} created successfully with privileges on ${MYSQL_DATABASE}."

# Create a second user (admin) and grant privileges
echo "Creating admin user: ${MYSQL_ADMIN_USER}..."
mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"
echo "Admin user ${MYSQL_ADMIN_USER} created successfully with privileges on ${MYSQL_DATABASE}."

# Flush privileges
echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;"
echo "Privileges flushed successfully."
