#!/bin/bash
# description: auto fix eth on VirtualBox when set NIC1 = NAT & NIC2 = Host only Adapter
# nano /etc/init.d/fixeth01
if grep -q eth0 /etc/udev/rules.d/70-persistent-net.rules; then
   rm -f /etc/udev/rules.d/70-persistent-net.rules
   /sbin/start_udev
   /sbin/service network restart;
fi
#chkconfig --add fixeth01

#ifcfg-eth0
DEVICE=eth0
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=dhcp

#ifcfg-eth1
DEVICE=eth1
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
IPADDR=192.168.56.56