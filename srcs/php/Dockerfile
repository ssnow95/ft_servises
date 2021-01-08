# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:55:14 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/19 18:55:23 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#файловый менеджер- необходим для работы php
RUN 	apk update && \
		apk add openrc
#обеспечивает работу нескольких процессов одновременно
RUN		apk add nginx && \
		apk add supervisor
#Для phpmyadmin
RUN apk add nginx php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session wget curl
RUN mkdir /www
RUN mkdir /www/phpmyadmin
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components 1 -C /www/phpmyadmin  
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
COPY /config.inc.php /www/phpmyadmin/config.inc.php

COPY start.sh ./
COPY default /etc/nginx/conf.d/nginx.conf
COPY supervisord.conf ./etc/supervisord.conf

RUN chmod +x start.sh

EXPOSE 5000

ENTRYPOINT [ "sh", "start.sh" ]