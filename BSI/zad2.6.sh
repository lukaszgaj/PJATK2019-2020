#!/bin/bash

ip=172.22.132.12

adres_mac=00:80:48:14:A4:68

echo "USTAWIAM DOMYSLNA POLITYKE"
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

echo "ROBIE"

iptables -I INPUT -m mac --mac-source $adres_mac -j REJECT
