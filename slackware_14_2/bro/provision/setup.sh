#!/bin/bash

echo "Provisioning virtual machine..."

echo "Downloading Bro Slackware Package..."
wget --quiet https://www.dropbox.com/s/ams81e87juwiyx1/bro-2.4.1-i386-1.tgz?dl=0
echo "Downloading Bro Slackware Package...DONE"

echo "Installing Bro Slackware Package..."
installpkg --terse bro-2.4.1-i386-1.tgz
echo "Installing Bro Slackware Package..."

echo "Configuring Bro..."

echo "Configuring Bro...DONE"
