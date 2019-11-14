# TIG-Stack-Vagrant
How to create a TIG (Telegraf, InfluxDB,Grafana) Stack using Vagrant

## After launching install.sh you have to:
1. Connect to Grafana using admin/admin
2. Add influxdb data source with
  Name: influxdb
  Type: influxdb
  URL: http://localhost:8086/
  Database: telegraf
  User: telegraf
  Password: 'password'
  Then save and exit
3. Click "+" botton on the left and click "import", then specify 5955, hit tab and specify influxdb data source

## 1. Main script <a href=TIG_Stack.sh>TIG_Stack.sh</a>
## 2. <a href=Vagrantfile>Vagrantfile</a> used by Vagrant
## 3. <a href=provision_tighost_script.sh>provision_tighost_script.sh</a> for provisioning
## 3. <a href=provision_client_script.sh>provision_client_script.sh</a> for provisioning
## 4. <a href=testTIG.sh>testTIG.sh</a> Unit Test
## 5. Log file <a href=log.txt>log.txt</a>
## 6. <a href=create_data.sh>Script</a> to create <a href=import>import</a> file for InfluxDB
## 7. <a href=params.sh>Params</a> to customize the installation
## 8. Grafana screeshot <img src=grafana.png>
