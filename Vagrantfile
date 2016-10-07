# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "geerlingguy/ubuntu1604"
  
  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.2.1"
    master.vm.provision "chef_solo" do |chef|

      chef.cookbooks_path = "../"

      chef.add_recipe "cluster-provision::install_docker"
      # chef.add_recipe "cluster-provision::install_ofed"
      chef.add_recipe "cluster-provision::etcd_image"
      chef.add_recipe "cluster-provision::swarm_etcd"
      chef.add_recipe "cluster-provision::swarm_image"
      chef.add_recipe "cluster-provision::swarm_master"
      chef.add_recipe "cluster-provision::swarm_agent"
      
    end
  end


  config.vm.define "agent" do |agent|
    agent.vm.network "private_network", ip: "192.168.2.2"
    agent.vm.provision "chef_solo" do |chef|

      chef.cookbooks_path = "../"

      chef.add_recipe "cluster-provision::install_docker"
      # chef.add_recipe "cluster-provision::install_ofed"
      chef.add_recipe "cluster-provision::swarm_image"
      chef.add_recipe "cluster-provision::swarm_agent"
      
    end
  end
  
  
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
end
