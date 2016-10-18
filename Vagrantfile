# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.vm.define :centos_database do |db|
     db.vm.box = "centos64_update"
     db.vm.network :private_network, ip: "192.168.56.102"
     db.vm.network "public_network", :bridge => "eth3", ip:"192.168.130.92", :auto_config => "false", :netmask => "255.255.255.0"
     db.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "centos_database" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "postgres"
    end 
  end

  config.vm.define :centos_sinatra do |server|   
     server.vm.box = "centos/7"
     server.vm.network :private_network, ip: "192.168.56.101"
     server.vm.network "public_network", :bridge => "eth3", ip:"192.168.130.91", :auto_config => "false", :netmask => "255.255.255.0"
     server.vm.network "forwarded_port", guest: 8585, host: 8585
     server.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "centos_sinatra" ]
     end
     config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "sinatra"
     end  
  end
end