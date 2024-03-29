#!/bin/bash

sleep 3


# Define the path to the WordPress configuration file
conf_file="/var/www/html/wp-config.php"

# Function to download WordPress core files
wp_download()
{
    if wp core download --allow-root; 
    then
        return 1
    else
        return 0
    fi
}

# Function to create the wordpress configuration (wp-config.php)
wp_config() 
{
    if wp config create \
        --allow-root \
        --path=/var/www/html/ \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$MARIADB_HOST
    then
        return 1
    else
        return 0
    fi
}

# Function to install WordPress
wp_install()
{
    if wp core install    \
        --allow-root \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASS \
        --admin_email=$WP_ADMIN_EMAIL \
        --url=$WP_URL 
    then
        wp user create \
        --allow-root \
        $WP_USER $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASS
        return 1
    else
        return 0
    fi
}

# This section of the shell script checks if the file specified by the variable `` exists.
    # Initialization
    command=0
    attempts=0
    max_attempts=5
    
    # change directory to WordPress installation path
    cd /var/www/html/

    # Loop until the file is downloaded or the number of attempts 
    # has exceeded the maximum 
    while [ $attempts -le $max_attempts ]; do

        if [ $command -eq 0 ]; then
            echo "Downloading Wordpress..."
            wp_download
            ((command+=1))
        fi
        if [ $command -eq 1 ]; then
            echo "Configuring Wordpress..."
            wp_config
            ((command+=1))
        fi
        if [ $command -eq 2 ]; then
            echo "Installing Wordpress..."
            wp_install
            ((command+=1))
        fi
        if [ $command -ge 3 ]; then
            break
        fi
        ((attempts+=1))

        sleep 1

    done
    
    if [ $attempts -ge $max_attempts ]; then
        echo "Failed to install Wordpress"
    else
        echo "Wordpress installed successfully"
    fi
  

exec "$@"