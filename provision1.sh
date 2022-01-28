#!/bin/bash

sudo apt-get update;
sudo apt-get install -y apache2;
sudo service apache2 start;
sudo apt-get install -y mariadb-client
sudo apt-get install -y nodejs;
sudo apt-get install -y nodejs-legacy;
sudo npm install --no-optional -y npm@latest -g;
sudo apt-get install -y npm;
cd /var/www/html/movie-analyst-ui
sudo node server.js &
