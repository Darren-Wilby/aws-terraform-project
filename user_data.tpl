#!/bin/bash
sudo apt update
sudo apt install nginx -y
echo "<html><body><h1>AWS Network provisioned by Terraform</h1></body></html>" | sudo tee  /var/www/html/index.html  