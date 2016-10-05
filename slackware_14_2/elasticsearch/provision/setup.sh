#!/bin/bash

echo "Provisioning virtual machine..."

echo "Downloading Elasticsearch..."
wget --quiet https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.1/elasticsearch-2.4.1.tar.gz
echo "Downloading Elasticsearch...DONE"

echo "Extracting Elasticsearch..."
tar xzf elasticsearch-2.4.1.tar.gz
echo "Extracting Elasticsearch...DONE"

echo "Configuring Elasticsearch..."
chown -R vagrant:users elasticsearch-2.4.1
rm -f elasticsearch-2.4.1.tar.gz
IP_ADDRESS=$(/sbin/ip -f inet addr show eth1 | grep -Po 'inet \K[\d.]+')

echo "network.host: $IP_ADDRESS" >> elasticsearch-2.4.1/config/elasticsearch.yml

mkdir opt
mv elasticsearch-2.4.1 opt

ln -s opt/elasticsearch-2.4.1/bin/elasticsearch
echo "Configuring Elasticsearch...DONE"
echo ""
echo "IP Address: $IP_ADDRESS"
echo ""
