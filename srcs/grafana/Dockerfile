# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssnowbir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 18:50:52 by ssnowbir          #+#    #+#              #
#    Updated: 2020/12/19 18:51:01 by ssnowbir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN 	apk update && \
        apk add openrc 
RUN     wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz
RUN     tar -zxvf grafana-7.3.6.linux-amd64.tar.gz

COPY    start.sh /
RUN     chmod +x start.sh
COPY    grafana.ini /usr/share/grafana/conf/custom.ini
COPY srcs/grafana.db ./grafana-7.3.6/data/grafana.db

RUN set -ex \
    && addgroup -S grafana \
    && adduser -S -G grafana grafana \
    && apk add --no-cache libc6-compat ca-certificates su-exec bash

EXPOSE  3000

CMD     [ "sh", "start.sh" ]