#!/bin/bash
set -e

# update 
sudo apt-get update -y
# install git
sudo apt-get install git -y 

# install ansible on Ubuntu:
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt install ansible -y
sudo apt install python-apt -y

# cp ~/.ssh/id_rsa* /home/Ubuntu/.ssh/
# echo `cat ~/.ssh/id_rsa.pub` >> ~/.ssh/authorized_keys


# Install necessary dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get -y -qq install curl wget git vim apt-transport-https ca-certificates
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt -y -qq install golang-go

# Setup sudo to allow no-password sudo for "hashicorp" group and adding "jenkins" user
sudo groupadd -r hashicorp
sudo useradd -m -s /bin/bash jenkins
sudo usermod -a -G hashicorp jenkins
sudo cp /etc/sudoers /etc/sudoers.orig
echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

# Installing SSH key
sudo mkdir -p /home/jenkins/.ssh
sudo chmod 700 /home/jenkins/.ssh
sudo cp /tmp/tf-packer /home/jenkins/.ssh/id_rsa
sudo chmod 0600 /home/jenkins/.ssh/id_rsa
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/id_rsa.pub
sudo cp /tmp/tf-packer.pub /home/jenkins/.ssh/authorized_keys
sudo chmod 600 /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins:jenkins /home/jenkins/.ssh
sudo usermod --shell /bin/bash jenkins

sudo apt-get install python3-pip -y
sudo pip3 --version
sudo -H pip3 install --user boto
sudo -H pip3 install boto

# Create GOPATH for jenkins user & download the webapp from GitHub

sudo -H -i -u jenkins -- env bash << EOF
whoami
echo ~jenkins

cd /home/jenkins

export GOROOT=/usr/lib/go
export GOPATH=/home/jenkins/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
go get -d github.com/hashicorp/learn-go-webapp-demo
EOF



