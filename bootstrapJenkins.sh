#!/usr/bin/env bash

apt-add-repository ppa:ansible/ansible
sudo add-apt-repository -y ppa:webupd8team/java
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
apt-get update
apt-get -y upgrade
#
#sudo apt-get -y install oracle-java8-installer
apt-get install -y jenkins
apt-get install -y software-properties-common
apt-get install -y ansible
apt-get install -y python
