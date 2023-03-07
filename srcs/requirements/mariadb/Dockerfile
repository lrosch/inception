FROM debian:buster

RUN apt update; apt install -y mariadb-server

COPY ./tools/createdatabase.sql ./
COPY ./tools/50-server.cnf ./etc/mysql/mariadb.conf.d/

RUN service mysql start && mysql < createdatabase.sql

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]
