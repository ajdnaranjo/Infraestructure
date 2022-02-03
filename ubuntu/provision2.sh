#!/bin/bash

(sudo apt-get update;
sudo apt-get install -y apache2;
sudo service apache2 start;
sudo apt-get install -y mariadb-client
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -;
sudo apt-get install -y nodejs
sudo apt-get install -y nodejs-legacy;
sudo apt-get install -y nodejs npm;
sudo npm install npm -g
cd /var/www/html/movie-analyst-api;
sudo npm install; 
sudo npm install --global mocha
sudo npm test &)| tee ./var/www/html/my.log


