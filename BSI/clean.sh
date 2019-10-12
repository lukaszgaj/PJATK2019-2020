#!/bin/bash

echo "CZYSZCZENIE"
iptables -F

echo "ODBLOKOWANIE"
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -vnL
