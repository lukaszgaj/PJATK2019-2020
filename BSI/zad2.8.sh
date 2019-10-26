#!/bin/bash

# Zamiana adresow sieci wewnetrznej na staly adres publiczny (static IP)

iptables -t nat -A POSTROUTNG -p tcp -o eth0 -j SNAT --to IPX
