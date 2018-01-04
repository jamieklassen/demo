# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "agile-coe-demo"
  config.vm.base_mac = "0293061CA64F"
  config.ssh.username = "ubuntu"
  config.ssh.password = "379a8188cba8c5e64b9a429f"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 8082, host: 8082
  config.vm.network "forwarded_port", guest: 8083, host: 8083
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
end
