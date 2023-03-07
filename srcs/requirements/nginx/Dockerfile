FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 100 -nodes \
    -out /etc/nginx/ssl/lrosch.crt \
    -keyout /etc/nginx/ssl/lrosch.key \
    -subj "/C=DE/L=Heilbronn/0=42/OU=lrosch/CN=lrosch"

COPY default /etc/nginx/sites-available/default
 
EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

