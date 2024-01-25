#!/bin/bash

# Function to wait for MariaDB to be ready
wait_for_mariadb() {
    until mysqladmin ping -h localhost --silent; do
        echo 'Waiting for MariaDB to be ready...'
        sleep 1
    done
}

# Start MariaDB service
service mariadb start

# Wait for MariaDB to be ready
wait_for_mariadb

# Create the database and grant privileges
mysql -u root -e \
    "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
    GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
    FLUSH PRIVILEGES;"

# Create a second user (admin) and grant privileges
mysql -u root -e \
    "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD'; \
    FLUSH PRIVILEGES;"

# Stop MariaDB service
service mariadb stop

# Start MariaDB in the foreground
exec mysqld_safe --bind-address=0.0.0.0