FROM nginx:1.10

RUN apt-get update && apt-get install python3-pip -yqq

# Install application requirements
ADD ./services/webserver/config/requirements.txt /root
RUN pip3 install -r /root/requirements.txt

ADD ./config/environment/development.env /root

# Add start script
ADD ./services/webserver/config/start.sh /
RUN chmod +x start.sh

# Add nginx config file
ADD ./services/webserver/config/nginx.tmpl /
ADD ./services/webserver/config/nginx.conf.j2 /

# Add SSL certs to location specified in nginx.conf
ADD ./services/webserver/config/*.crt /etc/ssl/certs/
ADD ./services/webserver/config/*.key /etc/ssl/private/

# Execute start script
CMD ["./start.sh"]
