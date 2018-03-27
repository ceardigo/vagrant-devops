# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configurações gerias
VAGRANT_VM_PROVIDER = "virtualbox"

# Configuração tomcat
MEMORIA_TOMCAT = 256
VERSAO_VM_TOMCAT = "ubuntu/xenial64"

# Configuração Jenkins
VERSAO_VM_JENKINS = "ubuntu/xenial64"
MEMORIA_JENKINS = 768
NOME_HOST_JENKINS = "jenkins"

# Configuração Nginx
VERSAO_VM_NGINX = "ubuntu/xenial64"
MEMORIA_NGINX = 256
NOME_HOST_NGINX = "nginx"

# Quantidade de servidores para cada tipo
QUANTIDADE_SERVIDORES_TOMCAT_PROD = 1
QUANTIDADE_SERVIDORES_TOMCAT_QA = 1
QUANTIDADE_SERVIDORES_TOMCAT_DES = 1

NOME_HOST_PROD = "prod"
NOME_HOST_QA = "qa"
NOME_HOST_DES = "des"


Vagrant.configure("2") do |config|

    # Iniciar servidores tomcat de Produção
	(1..QUANTIDADE_SERVIDORES_TOMCAT_PROD).each do |i|
    	config.vm.define "prd#{i}" do |node|
            node.vm.box = VERSAO_VM_TOMCAT
       		node.vm.hostname = NOME_HOST_PROD#{i}
            node.ssh.insert_key = false
        	node.vm.network :private_network, ip: "10.0.15.2#{i}"
        	node.vm.network "forwarded_port", guest: 8080, host: "808#{i}"
        	node.vm.provision :shell, path: "bootstrapTomcat.sh"
        	
        	node.vm.provider VAGRANT_VM_PROVIDER do |vb|
          		vb.memory = MEMORIA_TOMCAT
        	end
		end
    end
    
    # Iniciar servidores tomcat de QA
    (1..QUANTIDADE_SERVIDORES_TOMCAT_QA).each do |i|
        config.vm.define "qa#{i}" do |node|
            node.vm.box = VERSAO_VM_TOMCAT
            node.vm.hostname = NOME_HOST_QA#{i}
            node.ssh.insert_key = false
            node.vm.network :private_network, ip: "10.0.15.4#{i}"
            node.vm.network "forwarded_port", guest: 8080, host: "818#{i}"
            node.vm.provision :shell, path: "bootstrapTomcat.sh"
            
            node.vm.provider VAGRANT_VM_PROVIDER do |vb|
                vb.memory = MEMORIA_TOMCAT
            end
        end
    end
    
    # Iniciar servidores tomcat de DES
    (1..QUANTIDADE_SERVIDORES_TOMCAT_DES).each do |i|
        config.vm.define "des#{i}" do |node|
            node.vm.box = VERSAO_VM_TOMCAT
            node.vm.hostname = NOME_HOST_DES#{i}
            node.ssh.insert_key = false
            node.vm.network :private_network, ip: "10.0.15.6#{i}"
            node.vm.network "forwarded_port", guest: 8080, host: "828#{i}"
            node.vm.provision :shell, path: "bootstrapTomcat.sh"
            
            node.vm.provider VAGRANT_VM_PROVIDER do |vb|
                vb.memory = MEMORIA_TOMCAT
            end
        end
    end
    
    config.vm.define "jenkins" do |jenkins|
        jenkins.vm.hostname = NOME_HOST_JENKINS
        jenkins.vm.box = VERSAO_VM_JENKINS
        jenkins.vm.network "private_network", ip: "10.0.15.2"
        jenkins.vm.provision :shell, path: "bootstrapJenkins.sh"
        jenkins.vm.network "forwarded_port", guest: 8080, host: 9090

        jenkins.vm.provider VAGRANT_VM_PROVIDER do |vb|
            vb.memory = MEMORIA_JENKINS
        end
    end

    config.vm.define "nginx" do |nginx|
        nginx.vm.hostname = NOME_HOST_NGINX
        nginx.vm.box = VERSAO_VM_NGINX
        nginx.vm.network "private_network", ip: "10.0.15.8"
        nginx.vm.provision :shell, path: "bootstrapNginx.sh"
        nginx.vm.network "forwarded_port", guest: 80, host: 9595

        nginx.vm.provider VAGRANT_VM_PROVIDER do |vb|
            vb.memory = MEMORIA_NGINX
        end
    end

end
