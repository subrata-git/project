# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:14.04

MAINTAINER Subrata Chakraborty version: 0.1

RUN sudo apt-get update && sudo apt-get install -y apache2 && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
