
#!/usr/bin/bash

sudo systemctl daemon-reload

sudo systemctl restart gunicorn.service
sudo rm -f /etc/nginx/sites-enabled/default

sudo cp /home/ubuntu/blogprojectdrf/nginx/nginx.conf /etc/nginx/sites-available/blog
sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled
sudo nginx -t
sudo systemctl restart nginx
sudo ufw delete allow 8000
sudo ufw allow 'Nginx Full'