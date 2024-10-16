#!/bin/bash
# install docker
sudo apt update
sudo apt install -yq apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
apt-cache policy docker-ce
sudo apt install -yq docker-ce
sudo systemctl status docker

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# configure timezone
export TZ="America/New_York"
echo "America/New_York" | sudo tee /etc/timezone
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure --frontend noninteractive locales tzdata
sudo timedatectl set-timezone America/New_York

