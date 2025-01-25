#!/bin/bash
#
# Author: Apache X692
# Created on: 25/01/2024
sudo apt update && sudo apt upgrade -y

sudo apt install -y ufw auditd apparmor

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh && sudo ufw allow http && sudo ufw allow https
sudo ufw enable

sudo sed -i 's/^PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl reload sshd

echo "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter=1" >> /etc/sysctl.conf
echo "kernel.dmesg_restrict=1" >> /etc/sysctl.conf
echo "fs.protected_hardlinks=1" >> /etc/sysctl.conf
echo "fs.protected_symlinks=1" >> /etc/sysctl.conf
sysctl -p

systemctl enable auditd && systemctl start auditd
auditctl -e 1

sudo systemctl enable apparmor && systemctl start apparmor

sudo apt autoremove -y && sudo apt clean
sudo reboot
