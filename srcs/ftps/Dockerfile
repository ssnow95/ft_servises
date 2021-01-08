# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/20 13:39:38 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/20 13:39:41 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

#файловый менеджер- необходим для работы php
RUN 	apk update && \
        apk add openrc 
#устанавливаем ftp и ssl т.к указано ftps
RUN	apk add vsftpd && \
        apk add openssl

#Создаем самоподписанный сертификат
#Для того чтобы не вводить в интерактивном режиме данные о себе C=страна, ST-штат L-город O-имя организации CN- имя по которому к серверу будут обращаться
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=ssnowbir/CN=localhost"


RUN     adduser -D -h /var/ftp ssnowbir; echo "ssnowbir:ssnowbir" | chpasswd

RUN     mkdir -p /var/ftp

COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY    start.sh .

RUN     chmod 711 start.sh

EXPOSE  21 1025

CMD     [ "sh", "start.sh" ]