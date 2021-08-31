#!/bin/bash

# update 
sudo yum update -y

# install amazon-linux-extras epel 
sudo amazon-linux-extras install epel -y

# Add jenkins SSH key
echo `cat /tmp/tf-packer.pub` >> ~/.ssh/authorized_keys


