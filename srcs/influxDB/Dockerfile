# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:52:17 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/19 18:52:19 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

#файловый менеджер- необходим для работы php
RUN 	apk update && \
        apk add openrc 
#устанавливаем influxdb
RUN	apk add influxdb

COPY    start.sh .
COPY    influxdb.conf /etc/influxdb/influxdb.conf

RUN     chmod 711 start.sh

EXPOSE  8086

CMD     [ "sh", "start.sh" ]