Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant"
  config.vm.box = "generic/ubuntu1804"

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
    libvirt.cpus   = 2
  end

  config.vm.define "tighost" do |tighost|
    tighost.vm.hostname = "tighost"
    tighost.vm.network :private_network, ip:  ENV['TIGHOST']
    tighost.vm.provision "shell" do |s|
      s.path = "provision_tighost_script.sh"
    end
  end

  config.vm.define "client" do |client|
    client.vm.hostname = "client"
    client.vm.network :private_network, ip: ENV['CLIENT']
    client.vm.provision "shell" do |s|
      s.path = "provision_client_script.sh"
    end
  end
end
