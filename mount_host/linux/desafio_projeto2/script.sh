#!/bin/bash

echo "Iniciando deploy do site linux dio"
sleep 1

echo "1 - Atualizando o servidor"
apt-get update
apt-get upgrade -y
sleep 1

echo "2 - Instando dependencias"
apt-get install apache2 unzip -y
sleep 1


echo "3 - Realizando deploy do site"

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip && cp -R linux-site-dio-main/* /var/www/html/
sleep 1

echo "Fim deploy"
sleep 2
