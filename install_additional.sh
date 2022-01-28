#!/bin/bash

#pip3 install gdown

#for kafka
sudo apt-get install -y libglib2.0 libglib2.0-dev
sudo apt-get install -y libjansson4  libjansson-dev
sudo apt-get install -y librdkafka1=0.11.3-1build1

#for autostartup
#sudo cp rc-local.service /etc/systemd/system/
#sudo cp "rc.local" /etc/
#sudo chmod +x /etc/rc.local
#sudo systemctl enable rc-local

sudo apt install -y lsof
sudo apt install -y autossh
sudo apt install -y libjson-glib-dev
