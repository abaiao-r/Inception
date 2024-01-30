# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaiao-r <abaiao-r@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 14:12:33 by abaiao-r          #+#    #+#              #
#    Updated: 2024/01/14 18:16:22 by abaiao-r         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Copy the configuration file for mariadb
COPY ./tools/mariadb.sh /home

RUN chmod +x /home/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/home/mariadb.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]