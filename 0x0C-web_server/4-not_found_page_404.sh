#!/bin/bash

# Update package lists
apt-get update

# Install nginx
apt-get install -y nginx

# Create custom 404 error page
echo "Ceci n'est pas une page" > /var/www/html/404.html

# Configure Nginx to use custom 404 error page
echo "error_page 404 /404.html;" >> /etc/nginx/sites-available/default

# Restart Nginx
service nginx restart
