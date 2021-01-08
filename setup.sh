minikube start --vm-driver=virtualbox

eval $(minikube -p minikube docker-env)
minikube dashboard &

#Делаем metallb
minikube addons enable metallb
kubectl apply -f ./srcs/configmap.yaml

# build grafana
docker build -t grafana_image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana_deploy.yaml
kubectl apply -f ./srcs/grafana/grafana_serv.yaml

# build telegraf
docker build -t telegraf_image ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/telegraf.yaml

# build influxdb
docker build -t influxdb_image ./srcs/influxdb/
kubectl apply -f ./srcs/influxdb/influxDB_volume.yaml
kubectl apply -f ./srcs/influxdb/influxDB_deploy.yaml
kubectl apply -f ./srcs/influxdb/influxDB_serv.yaml

# build nginx
docker build -t nginx_image ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx_deploy.yaml
kubectl apply -f ./srcs/nginx/nginx_serv.yaml

# build php
docker build -t php_image ./srcs/php/
kubectl apply -f ./srcs/php/php_deploy.yaml
kubectl apply -f ./srcs/php/php_serv.yaml

# build wordpress
docker build -t wordpress_image ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wordpress_deployment.yaml
 kubectl apply -f ./srcs/wordpress/wordpress_serv.yaml

# build mysql
docker build -t mysql_image ./srcs/mySQL/
kubectl apply -f ./srcs/mySQL/mysql_volume.yaml
kubectl apply -f ./srcs/mySQL/mysql_deploy.yaml
kubectl apply -f ./srcs/mySQL/mysql_serv.yaml

# build ftps
docker build -t ftps_image ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps_deploy.yaml
kubectl apply -f ./srcs/ftps/ftps_serv.yaml


# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/telegraf -- pkill telegraf
# kubectl exec deploy/influxdb -- pkill influx
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7
# kubectl exec deploy/mysql -- pkill /usr/bin/mysqld 
# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd
