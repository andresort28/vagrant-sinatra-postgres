# Vagrant-Sinatra-Postgres
Code of automatic provisioning of an infrastructure of a web application server using sinatra framework and postgres database on CentOS

This code will allow to any developer to deploy automatically a virtual infrastructure containing:

* One web application server with Sinatra framework
* One database using postgresql

This kind of infrastructure was deployed under a Linux based operating system, specifically ubuntu 14.04.

### Required Software:
* Vagrant
* Chef Solo
* VirtualBox

In the sections below, instructions for executing the provisioning infrastructure are presented:

### Clone the repository
Clone the repository to any folder in your computer
```sh
git clone https://github.com/andresort28/vagrant-sinatra-postgres.git
```

### Download CentOS
Due to each virtual machine has an operating system CentOS 7, you need to download a **.box** containing a clean CentOS 7 distribution from the following link:
```sh
https://atlas.hashicorp.com/boxes/search
```

### Install a BOX in Vagrant
Add the **.box** with the name *centos7*
```sh
vagrant box add centos6 /.../centos6.box
```

### Edit settings
Go to **Vagrantfile** an edit the name of the box you added to vagrant
```sh
server.vm.box = "centos7"
...
db.vm.box = "centos7"
```

### Deploy
Open a terminal, go to the directory where you cloned the repository, and deploy the infrastructure
```sh
vagrant up
```

### Verify
Open a browser and type 192.168.56.101:8585/ to see main website, and type "/devices" or "/brands" to view the queries to the database according to the web server

Ready !

## Contribute
Github is all about contributions. If you think you can collaborate or improve this, please make sure you send me a pull request

## License
Copyright (c) 2016 [Andres Ortiz](http://www.andresfelipeortiz.com).  
Licensed under the MIT license.