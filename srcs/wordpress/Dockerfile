# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:57:01 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/19 18:57:03 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#файловый менеджер- необходим для работы php
RUN 	apk update && \
		apk add openrc
#обеспечивает работу нескольких процессов одновременно
RUN		apk add nginx && \
		apk add supervisor
#Для wordpress
RUN mkdir www
RUN wget https://wordpress.org/latest.zip && \
		unzip latest.zip && \
		mv wordpress /www/ && \
		rm latest.zip
RUN apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY /wp-config.php ./www/

COPY start.sh ./
COPY default /etc/nginx/conf.d/default.conf
COPY supervisord.conf ./etc/supervisord.conf

RUN chmod +x start.sh

EXPOSE 5050

ENTRYPOINT [ "sh", "start.sh" ]

