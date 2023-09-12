#!/bin/bash
sudo apt update
sudo apt install nginx -y
echo "<html><body><h1>Terraform Provisioned Me</h1></body></html>" | sudo tee  /var/www/html/index.html      