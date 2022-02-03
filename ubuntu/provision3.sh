#!/bin/bash

apt-get update
sudo apt-get install -y mariadb-server
sudo apt-get install -y mariadb-client

sudo mysql << EOF
USE mysql;
CREATE USER 'juan'@'%' IDENTIFIED BY 'pass123';
GRANT ALL PRIVILEGES ON *.* TO 'juan'@'%';
UPDATE user SET plugin='mysql_native_password' WHERE User='juan';
FLUSH PRIVILEGES;
create database movie_db;
use movie_db;
source /var/www/html/movie-analyst-api/data_model/table_creation_and_inserts.sql;
EOF
sudo sed -i '29,30 s/^/#/' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo ufw status
sudo ufw allow 3306/tcp

sudo service mysql restart