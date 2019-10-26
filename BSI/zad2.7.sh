#!/bin/bash

# SYN FLOODING
# ograniczenie do sprawdzania reguy 1 raz na sekund:
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT

# burst - sprawdzana jest seria pakietow (3) - jesli pasuja netfilter czeka 3 sekundy 
# z ponownym sprawdzaniem
iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 3 -j ACCEPT

# ICMP Flooding
# ograniczenie do sprawdzania pakietow icmp echo request do 1 na sekunde:
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
