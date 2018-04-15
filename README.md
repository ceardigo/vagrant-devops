# vagrant-devops

## Objective
Create some VM's to simulate different environments and test DevOps workflow. This Vagrant file will only create a simple VM with specific service running, not additional setup (no default apps, no default password and so on).

## TODO
* Create specific files for Tomcat
	* Default application
	* Set up default passwords for tomcat admin 

* Create specific files for Jenkins
	* Set up admin password
	* Instal necessary plugins
	* Default job pipeline



## Tomcat servers
Creates any number of VM's with Tomcat server running. There is no additional setup, just a VM with Tomcat.

*TOMCAT_QUANTITY_SERVERS_PROD:* Number of PRD servers to create.
*TOMCAT_QUANTITY_SERVERS_QA* Number of QA servers to create.
*TOMCAT_QUANTITY_SERVERS_DEV* Number of Dev servers to create.

### Prod
Prodution servers

* IP's: 10.0.15.2#, where '#' is the index in the looping. For example, for two servers we will have 10.0.15.21 and 10.0.15.22.
* Ports: Guest port (VM) will always be 8080. Host port will be 808#, where '#' is the index in the looping. For example, for two servers the Host ports will be http://localhost:8081 and http://localhost:8082.
* Initial script to be executed: ./bootstrapTomcat.sh

### QA
QA servers

* IP's: 10.0.15.4#, where '#' is the index in the looping. For example, for two servers we will have 10.0.15.41 and 10.0.15.42.
* Ports: Guest port (VM) will always be 8080. Host port will be 808#, where '#' is the index in the looping. For example, for two servers the Host ports will be http://localhost:8181 and http://localhost:8182.
* Initial script to be executed: ./bootstrapTomcat.sh

### Dev
Development servers

* IP's: 10.0.15.6#, where '#' is the index in the looping. For example, for two servers we will have 10.0.15.61 and 10.0.15.62.
* Ports: Guest port (VM) will always be 8080. Host port will be 808#, where '#' is the index in the looping. For example, for two servers the Host ports will be http://localhost:8281 and http://localhost:8282.
* Initial script to be executed: ./bootstrapTomcat.sh

### Nginx
Http server, will be used to store static resources (css, js and etc.).

* IP: 10.0.15.8.
* Port: Guest port (VM) is 80, Host port is 9595 (http://localhost:9595)
* Initial script to be executed: ./bootstrapNginx.sh

### Jenkins
Jenkins server, to create build pipeline.

* IP: 10.0.15.2.
* Port: Guest port (VM) is 8080, Host port is 9090 (http://localhost:9090)
* Initial script to be executed: ./bootstrapJenkins.sh
