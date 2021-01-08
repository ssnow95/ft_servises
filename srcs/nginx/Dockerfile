# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:54:35 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/20 13:25:42 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#файловый менеджер- необходим для работы nginx
RUN 	apk update && \
		apk add openrc 
#обеспечивает работу нескольких процессов одновременно
RUN		apk add nginx && \
		apk add supervisor

RUN		apk add openssl && \
		apk add openssh
#Создаем директорию для индекса
RUN		mkdir www
COPY	./index.html /www/
#Меняем файлдля nginx
COPY default /etc/nginx/conf.d/default.conf

COPY start.sh ./
COPY supervisord.conf ./etc/supervisord.conf

#Создаем самоподписанный сертификат
#Для того чтобы не вводить в интерактивном режиме данные о себе C=страна, ST-штат L-город O-имя организации CN- имя по которому к серверу будут обращаться
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt -subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=ssnowbir/CN=localhost"

RUN chmod +x start.sh

EXPOSE 80 443 22

ENTRYPOINT [ "sh", "start.sh" ]
