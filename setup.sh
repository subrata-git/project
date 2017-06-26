#!/bin/bash

set -e -x

# Needed so that the aptitude/apt-get operations will not be interactive
export DEBIAN_FRONTEND=noninteractive

sudo add-apt-repository ppa:formorer/icinga --yes
sudo apt-get --yes --quiet update && sudo apt-get -y --quiet upgrade && sudo apt-get -y --quiet install mysql-client htop git awscli

wget -qO- https://get.docker.com/ | sh

# pull the docker image
sudo docker pull mysql

# run the container on top of the image
sudo docker run -p 3900:3306 --name mysql -e MYSQL_ROOT_PASSWORD=crossover -d mysql:latest

sudo git clone https://github.com/subrata-git/project.git && cd project && sudo docker build -t project:apache .

sudo docker run -d -p 80:80 --name apache --link mysql:mysql -v /var/www/html:/var/www/html project:apache

sudo cp db.php index.php logout.php /var/www/html/
sudo cp cronlogs.sh /root && sudo chmod +x /root/cronlogs.sh
echo '* 19 * * * /root/cronlogs.sh' | crontab -e
