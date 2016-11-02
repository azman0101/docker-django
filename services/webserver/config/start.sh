#! /bin/bash
j2 nginx.conf.j2 /root/development.env > /etc/nginx/nginx.conf

nginx -g "daemon off;"
