#!/bin/bash


echo "leav realm"
realm leave indodana.id

realm leave soltech.local
echo "Install Paket Yang dibutuhkan"
yum install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation openldap-clients policycoreutils-python -y

echo "Ganti DNS 1"
sed -i 's/DNS1=10.10.31.1/DNS1=10.80.12.10/g' /etc/sysconfig/network-scripts/ifcfg-eth0

echo "add DNS2"
echo DNS2=10.80.12.13 >> /etc/sysconfig/network-scripts/ifcfg-eth0

echo "Add Local Domain"
echo DOMAIN=soltech.local >> /etc/sysconfig/network-scripts/ifcfg-eth0

echo "Restart Service Network"
service network restart

echo -n "Masukan User anda : ";
read user;

realm join -U $user soltech.local

echo "ganti sssd.conf "
rm /etc/sssd/sssd.conf -f

cp sssd.conf /etc/sssd/

chmod 600 /etc/sssd/sssd.conf

service sssd restart && systemctl daemon-reload && realm permit -g s_sysadmin s_server
echo ""%s_sysadmin" ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo ""%s_server" ALL=(ALL:ALL) ALL" >> /etc/sudoers

