#!/bin/sh

# Check if the database directory exists; if not, configure MariaDB
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

# Start MariaDB service
service mariadb start

# Run mysql_secure_installation non-interactively
mysql_secure_installation << END

Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
END
echo "MariaDB configured"
# Create database, user and grant privileges
echo "Creating database $MYSQL_DATABASE..."
    sleep 1
    mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;"
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    # Change root password and shutdown MariaDB
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

else
    sleep 1
    echo "The database $MYSQL_DATABASE already exists."
fi

echo "Done"

# Execute any additional commands passed to the shell script
exec "$@"