FROM debian:buster


RUN apt update -y 

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y

EXPOSE 9000

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d

CMD [ "/script.sh" ]
