FROM debian:8
#
## Dockerfile showing usage of shell script to perform more than one acttion on entry

RUN apt update && apt upgrade -y
RUN apt install git nginx -y

RUN rm /var/www/html/index.nginx-debian.html
RUN echo "git clone https://github.com/nihr43/example.org.git /var/www/html/" >> /tmp/entrypoint.sh
RUN echo 'nginx -g "daemon off;"' >> /tmp/entrypoint.sh

CMD ["sh", "/tmp/entrypoint.sh"]
