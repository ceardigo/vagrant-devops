# -*- mode: ruby -*-
# vi: set ft=ruby :

# Default VM Provider
VAGRANT_VM_PROVIDER = "virtualbox"

# Parameters for Tomcat servers
TOMCAT_VM_VERSION = "ubuntu/xenial64"
TOMCAT_MEMORY = 512

# Parameters for Jenkins server
JENKINS_VM_VERSION = "ubuntu/xenial64"
JENKINS_MEMORY = 2048
JENKINS_HOSTNAME = "jenkins"

# Parameters for nginx server
NGINX_VM_VERSION = "ubuntu/xenial64"
NGINX_MEMORY = 512
NGINX_HOSTNAME = "nginx"

# Define how many servers of each environment
TOMCAT_QUANTITY_SERVERS_PROD = 1
TOMCAT_QUANTITY_SERVERS_QA = 1
TOMCAT_QUANTITY_SERVERS_DEV = 1

# Hostnames
HOSTNAME_PROD = "prod"
HOSTNAME_QA = "qa"
HOSTNAME_DEV = "dev"


Vagrant.configure("2") do |config|

    # Start PROD Tomcat servers
	(1..TOMCAT_QUANTITY_SERVERS_PROD).each do |i|
    	config.vm.define "prd#{i}" do |node|
            node.vm.box = TOMCAT_VM_VERSION
       		node.vm.hostname = HOSTNAME_PROD#{i}
            node.ssh.insert_key = false
        	node.vm.network :private_network, ip: "10.0.15.2#{i}"
        	node.vm.network "forwarded_port", guest: 8080, host: "808#{i}"
        	node.vm.provision :shell, path: "bootstrapTomcat.sh"
        	
        	node.vm.provider VAGRANT_VM_PROVIDER do |vb|
          		vb.memory = TOMCAT_MEMORY
        	end
		end
    end
    
    # Start QA Tomcat servers
    (1..TOMCAT_QUANTITY_SERVERS_QA).each do |i|
        config.vm.define "qa#{i}" do |node|
            node.vm.box = TOMCAT_VM_VERSION
            node.vm.hostname = HOSTNAME_QA#{i}
            node.ssh.insert_key = false
            node.vm.network :private_network, ip: "10.0.15.4#{i}"
            node.vm.network "forwarded_port", guest: 8080, host: "818#{i}"
            node.vm.provision :shell, path: "bootstrapTomcat.sh"
            
            node.vm.provider VAGRANT_VM_PROVIDER do |vb|
                vb.memory = TOMCAT_MEMORY
            end
        end
    end
    
    # Start DEV Tomcat servers
    (1..TOMCAT_QUANTITY_SERVERS_DEV).each do |i|
        config.vm.define "des#{i}" do |node|
            node.vm.box = TOMCAT_VM_VERSION
            node.vm.hostname = HOSTNAME_DEV#{i}
            node.ssh.insert_key = false
            node.vm.network :private_network, ip: "10.0.15.6#{i}"
            node.vm.network "forwarded_port", guest: 8080, host: "828#{i}"
            node.vm.provision :shell, path: "bootstrapTomcat.sh"
            
            node.vm.provider VAGRANT_VM_PROVIDER do |vb|
                vb.memory = TOMCAT_MEMORY
            end
        end
    end
    
    # Start Jenkins VM
    config.vm.define "jenkins" do |jenkins|
        jenkins.vm.hostname = JENKINS_HOSTNAME
        jenkins.vm.box = JENKINS_VM_VERSION
        jenkins.vm.network "private_network", ip: "10.0.15.2"
        jenkins.vm.provision :shell, path: "bootstrapJenkins.sh"
        jenkins.vm.network "forwarded_port", guest: 8080, host: 9090

        jenkins.vm.provider VAGRANT_VM_PROVIDER do |vb|
            vb.memory = JENKINS_MEMORY
        end
    end

    # Start nginx VM
    config.vm.define "nginx" do |nginx|
        nginx.vm.hostname = NGINX_HOSTNAME
        nginx.vm.box = NGINX_VM_VERSION
        nginx.vm.network "private_network", ip: "10.0.15.8"
        nginx.vm.provision :shell, path: "bootstrapNginx.sh"
        nginx.vm.network "forwarded_port", guest: 80, host: 9595

        nginx.vm.provider VAGRANT_VM_PROVIDER do |vb|
            vb.memory = NGINX_MEMORY
        end
    end
end
