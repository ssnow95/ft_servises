#!bin/sh

mkdir /run/nginx
chmod 744 /run/nginx
mkdir /var/www/phpmyadmin/tmp
chmod 744 /var/www/phpmyadmin/tmp
/usr/bin/supervisord -c /etc/supervisord.conf