#!/usr/bin/env bash

sudo add-apt-repository -y ppa:webupd8team/java
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
apt-get update
#
#sudo apt-get -y install oracle-java8-installer
apt-get install -y jenkins
apt-get install -y python
apt-get -y upgrade
