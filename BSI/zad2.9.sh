#!/bin/bash
iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0 -j DNAT --to IP1:80
