#!/bin/bash

apt update -y

apt install nginx -y

systemctl enable nginx

systemctl start nginx

echo "Harsh Project 2 VM Working" >/var/www/html/index.html
