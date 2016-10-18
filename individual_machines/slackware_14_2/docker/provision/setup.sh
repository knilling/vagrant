#!/bin/bash

sed -i 's/^# Defaults secure/Defaults secure/' /etc/sudoers
groupadd docker
usermod -G docker vagrant
wget --quiet https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
tar xzf docker-latest.tgz
sudo mv docker/* /usr/local/bin/
rm -rf docker docker-latest.tgz 
curl -s -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
wget --quiet https://raw.githubusercontent.com/knilling/slackware/master/etc/rc.d/rc.docker -O /etc/rc.d/rc.docker
chmod +x /etc/rc.d/rc.docker
/etc/rc.d/rc.docker start