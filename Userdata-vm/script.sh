#!/bin/bash
sudo apt -y update
sudo apt -y install nginx
echo "nginx installed succesfully"
sudo systemctl start nginx
echo "nginx started"
sudo systemctl enable nginx
echo "nginx enabled"
 
#Install git - client for downloading code from GitHub
 
sudo apt -y install git
echo "git installed"
sudo rm -rf /var/www/html*
echo "file is removed"
sudo git clone https://github.com/Ai-TechNov/mario.git /var/www/html/
echo "new app cloned"