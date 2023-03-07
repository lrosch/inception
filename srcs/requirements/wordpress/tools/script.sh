#!/bin/bash
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod 777 wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php


sed -i -r "s/wordpress_database/$MYSQL_DATABASE/1"   wp-config.php
sed -i -r "s/wordpress_user/$MYSQL_USER/1"  wp-config.php
sed -i -r "s/wordpress_pwd/$MYSQL_PASSWORD/1"    wp-config.php

wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.3 -F
