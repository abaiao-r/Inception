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
	docker-compose -f srcs/docker-compose.yml up -d --build

# Stop and remove the Docker containers defined in the docker-compose.yml file
down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
# prune: Remove unused data
# -a: Remove all unused images not just dangling ones
# --volumes: Prune volumes
# --force: Do not prompt for confirmation
	docker system prune -a --volumes --force
	sudo rm -rf /home/abaiao-r/data/mysql/*
	sudo rm -rf /home/abaiao-r/data/wordpress/*


re: fclean build

# Declare the targets as phony to avoid conflicts with file names
.PHONY: build up down