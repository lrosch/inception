CREATE DATABASE wordpressdb;
CREATE USER lrosch@'%' IDENTIFIED BY 'hcsorl';
GRANT ALL PRIVILEGES ON wordpressdb.* TO lrosch@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'hcsorl';
