#!/bin/bash
sleep 5m
sudo mkfs -t ext4 /dev/xvdb
sudo mkfs -t ext4 /dev/xvdc
sudo mkfs -t ext4 /dev/xvdd
sudo mkdir /app1 /app2 /app3
sudo  mount /dev/xvdb /app1/ 
sudo  mount /dev/xvdc /app2/
sudo   mount /dev/xvdd /app3/
sudo echo '/dev/xvdb /app1 ext4 defaults 0 0' >> /etc/fstab
sudo echo '/dev/xvdc /app2 ext4 defaults 0 0' >> /etc/fstab
sudo echo '/dev/xvdd /app3 ext4 defaults 0 0' >> /etc/fstab
mount -a 
