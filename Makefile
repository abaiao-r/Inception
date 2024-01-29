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
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

fclean: clean
# prune: Remove unused data
# -a: Remove all unused images not just dangling ones
# --volumes: Prune volumes
# --force: Do not prompt for confirmation
	docker system prune -a --volumes --force
	rm -rf /home/abaiao-r/data

# Declare the targets as phony to avoid conflicts with file names
.PHONY: build up down