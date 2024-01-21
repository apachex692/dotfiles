#!/bin/bash
#
# Author: Sakthi Santhosh
# Created on: 04/09/2022
#
# Headless Setup Creator for Raspberry Pi
touch /media/sakthi/bootfs/ssh
cp ./wpa_supplicant.conf /media/sakthi/bootfs/wpa_supplicant.conf

echo "pi:\$6\$5esFFWNwNjVGH2Vy\$ZDpE7dL8K4lEArderu414hucZtbjnob9.l9Sk10f4Bmd2nse6LYQBkJu2CZxO5MlbfFgW.gK6HdyjM2o23Jfb0" > /media/sakthi/bootfs/userconf

mkdir /media/sakthi/rootfs/home/pi/.ssh/
cp -r ~/.ssh/dev-machine/* /media/sakthi/rootfs/home/pi/.ssh/
cat ~/.ssh/pi_dev-machine.pub > /media/sakthi/rootfs/home/pi/.ssh/authorized_keys

cp -r ~/Documents/Programming/dotfiles/dev-machine/.bash* /media/sakthi/rootfs/home/pi/
cp -r ~/.aws/ /media/sakthi/rootfs/home/pi/
