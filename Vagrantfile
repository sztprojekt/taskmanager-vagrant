# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty32"
  config.vm.hostname = 'sztprojekt'
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty32/versions/1/providers/virtualbox.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.56.101"
  config.vm.synced_folder "../taskmanager-web", "/vagrant", type: "nfs"
  config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'puppet/manifests'
      puppet.module_path = 'puppet/modules'
      puppet.manifest_file = 'default.pp'
  end
end
