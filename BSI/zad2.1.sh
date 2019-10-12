#!/bin/bash

iz=eth0

ip=172.22.132.12

echo "MOJE IP - " $ip

echo "USTAWIAM DOMYSLNA POLITYKE"
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

echo "Loopback -> ACCEPT"
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

echo "WWW -> ACCEPT"
#http
iptables -A OUTPUT -o eth0 -p tcp -s $ip -d 0/0  --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -s 0/0 -d $ip --sport 80 -j ACCEPT
#https
iptables -A OUTPUT -o eth0 -p tcp -s $ip -d 0/0 --dport 443 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -s 0/0 -d $ip --sport 443 -j ACCEPT
#dns
iptables -A OUTPUT -o eth0 -p udp -s $ip -d 0/0 --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p udp -s 0/0 -d $ip --sport 53 -j ACCEPT

echo "SSH -> ACCEPT"
iptables -A OUTPUT -o eth0 -p tcp -s $ip -d 0/0 --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp -s 0/0 -d $ip --sport 22 -j ACCEPT
