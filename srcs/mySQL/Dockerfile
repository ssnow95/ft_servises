# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:52:59 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/19 18:53:12 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#файловый менеджер- необходим для работы php
RUN 	apk update && \
		apk add openrc
#Для mySQL
RUN apk add mysql mysql-client

COPY start.sh database.sql wordpress.sql ./

COPY	./my.cnf /etc/my.cnf

RUN chmod +x start.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "start.sh" ]