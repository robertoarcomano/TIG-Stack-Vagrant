#!/bin/bash
# 0. Destroy existence vagrant VMs
source ./params.sh
vagrant destroy -f

# 1. Start Vagrant VMs
vagrant up --provider=libvirt

# 2. Launch tests
vagrant ssh tighost -c "sudo /vagrant/testTIG.sh"
