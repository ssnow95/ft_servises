# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:56:04 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/19 18:56:26 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN 	apk update && \
	apk add openrc

RUN     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz
RUN     tar -xzf telegraf-1.16.3_linux_amd64.tar.gz
RUN     rm -rf telegraf-1.16.3_linux_amd64.tar.gz
RUN     mv telegraf-1.16.3 /telegraf 
RUN    cp -r /telegraf/* / && rm -rf /telegraf

RUN     wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
        apk add glibc-2.28-r0.apk
#необходимо для того чтобы собрать все данные с других контейнеров
RUN     telegraf -sample-config telegraf.conf --input-filter cpu:mem --output-filter influxdb > telegraf.conf
COPY      telegraf.conf /etc/telegraf/telegraf.conf

CMD     [ "telegraf" ]