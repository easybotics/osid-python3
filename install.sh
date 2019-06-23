#! /bin/bash

#first we need to install all the python requirements 
sudo apt-get -y install python3 python3-pop dcfldd
sudo pip3 install -yr requirements.txt

#lets create our ramdisk 
sudo mkdir /mnt/ramdisk 
sudo mount -t tmpfs -o size=250m tmpfs /mnt/ramdisk 

echo 'tmpfs /mnt/ramdisk tmpfs   nodev,nosuid,noexec,nodiratime,size=250M   0 0' | tee -a /etc/fstab
cp osid.sh ~/Desktop/osid.sh
sudo chmod +x ~/Desktop/osid.sh
