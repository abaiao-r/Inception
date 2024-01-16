# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/09 16:31:31 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/16 14:47:05 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the project
NAME = inception

# Build the Docker containers defined in the docker-compose.yml file
build:
	docker-compose -f srcs/docker-compose.yml build

# Start the Docker containers defined in the docker-compose.yml file in detached mode
up:
	docker-compose -f srcs/docker-compose.yml up -d

# Stop and remove the Docker containers defined in the docker-compose.yml file
down:
	docker-compose -f srcs/docker-compose.yml down

# Start the MariaDB Docker container
run-mariadb:
	docker-compose -f srcs/docker-compose.yml up -d mariadb

# Start the Nginx Docker container
run-nginx:
	docker-compose -f srcs/docker-compose.yml up -d nginx

# Declare the targets as phony to avoid conflicts with file names
.PHONY: build up down