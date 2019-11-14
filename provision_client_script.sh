#!/bin/bash

# 0. Load Params
source /vagrant/params.sh

# 1. Install base packages
apt-get install -y bats jq openjdk-11-jre-headless mc apt-transport-https

# 2. Activate repository and install telegraf
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get update
apt-get install -y telegraf
mv /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.default
echo "
# Global Agent Configuration
[agent]
  hostname = \"$HOSTNAME\"
  flush_interval = \"15s\"
  interval = \"15s\"

# Input Plugins
[[inputs.cpu]]
    percpu = true
    totalcpu = true
    collect_cpu_time = false
    report_active = false
[[inputs.disk]]
    ignore_fs = [\"tmpfs\", \"devtmpfs\", \"devfs\"]
[[inputs.io]]
[[inputs.mem]]
[[inputs.net]]
[[inputs.system]]
[[inputs.swap]]
[[inputs.netstat]]
[[inputs.processes]]
[[inputs.kernel]]

# Output Plugin InfluxDB
[[outputs.influxdb]]
  database = \"$DATABASE\"
  urls = [ \"http://$TIGHOST:8086\" ]
  username = \"$USERNAME\"
  password = \"$PASSWORD\"
" > /etc/telegraf/telegraf.conf
systemctl enable telegraf
systemctl restart telegraf
