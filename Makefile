# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/09 16:31:31 by abaiao-r          #+#    #+#              #
#    Updated: 2024/02/02 13:35:36 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the project
NAME = inception

# Build the Docker containers defined in the docker-compose.yml file
build:
# -f: Specify an alternate compose file
# --build: Build images before starting containers
# -d: Detached mode: Run containers in the background
	docker-compose -f srcs/docker-compose.yml up -d --build

# Stop and remove the Docker containers defined in the docker-compose.yml file
down:
	docker-compose -f srcs/docker-compose.yml down

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
# prune: Remove unused data
# -a: Remove all unused images not just dangling ones
# --volumes: Prune volumes
# --force: Do not prompt for confirmation
	docker system prune -a --volumes --force
	docker network ls -q -f "driver=custom" | xargs -r docker network rm 2>/dev/null
	sudo rm -rf /home/abaiao-r/data/mysql/*
	sudo rm -rf /home/abaiao-r/data/wordpress/*

re: fclean build

info:
	@echo "Containers:"
	@docker ps -a
	@echo "------------------------------------------------------------"
	@echo "Images:"
	@docker images -a
	@echo "------------------------------------------------------------"
	@echo "Volumes:"
	@docker volume ls
	@echo "------------------------------------------------------------"
	@echo "Networks:"
	@docker network ls
	@echo "------------------------------------------------------------"

connect-mariadb:
	docker exec -it mariadb mysql -u root -p

connect-wordpress:
	docker exec -it wordpress /bin/bash

# Declare the targets as phony to avoid conflicts with file names
.PHONY: build up down clean fclean re info connect