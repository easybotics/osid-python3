#! /bin/bash

#first we need to install all the python requirements 
sudo apt-get -y install python3 python3-pip dcfldd
sudo pip3 install -r requirements.txt

#lets create our ramdisk 
sudo mkdir /mnt/ramdisk 
sudo mount -t tmpfs -o size=100m tmpfs /mnt/ramdisk 

echo 'tmpfs /mnt/ramdisk tmpfs   nodev,nosuid,noexec,nodiratime,size=100M   0 0' | sudo tee -a /etc/fstab
cp osid.sh /home/pi/Desktop/osid.sh
sudo chmod +x /home/pi/Desktop/osid.sh
