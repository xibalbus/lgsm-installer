#!/bin/bash

# ensure dependencies are installed
#sudo dpkg --add-architecture i386
#echo **** Updating package list ****
#sudo apt update
echo **** Installing Dependencies ****
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 libsdl2-2.0-0:i386 steamcmd lib32z1
echo **** Installing Ansible ****
sudo apt install -y ansible
mkdir -p installer
git clone --depth 1 https://github.com/xibalbus/lgsm-installer.git installer
echo Running ansible playbook
cd installer
ansible-playbook install-rustserver.yaml -i inventory/hosts -vv
