#!/bin/bash

# 1. Install base packages
apt-get install -y bats jq openjdk-11-jre-headless mc apt-transport-https

# 2. Activate repository and install influxDB
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get update
apt-get install -y influxdb

# 3. Enable and start influxDB
systemctl enable influxdb.service
systemctl start influxdb.service
sleep 10
