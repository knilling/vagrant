#!/bin/bash
echo "Downloading Bro Slackware Package..."
wget --quiet https://www.dropbox.com/s/ams81e87juwiyx1/bro-2.4.1-i386-1.tgz
echo "Downloading Bro Slackware Package...DONE"

echo "Installing Bro Slackware Package..."
installpkg --terse bro-2.4.1-i386-1.tgz
echo "Installing Bro Slackware Package..."

echo "Configuring Bro..."
echo "export PATH=$PATH:/usr/local/bro/bin/" >> /etc/profile
IP_ADDRESS=$(/sbin/ip -f inet addr show eth1 | grep -Po 'inet \K[\d.]+')
echo "Configuring Bro...DONE"
echo ""
echo "IP Address: $IP_ADDRESS"
echo ""
