#!/usr/bin/env bash

apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y software-properties-common
apt-get install -y ansible
apt-get -y upgrade
