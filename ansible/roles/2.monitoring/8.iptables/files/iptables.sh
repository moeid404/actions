#!/bin/bash
#[FLush,Delete-Chains and Zero all packets]
iptables -F
iptables -X
iptables -Z

#[DNS Resolving]
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

#[Internal connections]
#1#loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#[Incoming connections] [User >> SERVER]
#1#HTTP
iptables -A INPUT  -p tcp --dport 80 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -m conntrack --ctstate E -j ACCEPT
#2#HTTPS
iptables -A INPUT  -p tcp --dport 443 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -m conntrack --ctstate E -j ACCEPT
#3#SSH
iptables -A INPUT  -p tcp --dport 22 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate E -j ACCEPT
# Open port 9090 for prometheus
iptables -A INPUT -p tcp --dport 9090 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 9090 -m conntrack --ctstate E -j ACCEPT
# Open port 9100 for prometheus_node_exporter
iptables -A INPUT -p tcp --dport 9100 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 9100 -m conntrack --ctstate E -j ACCEPT

#[Outgoing connection] [Server >> Outside]
#1#HTTP
iptables -A OUTPUT -p tcp --dport 80 -m conntrack --ctstate N,E -j ACCEPT 
iptables -A INPUT -p tcp --sport 80 -m conntrack --ctstate E -j ACCEPT
#2#HTTPS
iptables -A OUTPUT -p tcp --dport 443 -m conntrack --ctstate N,E -j ACCEPT
iptables -A INPUT  -p tcp --sport 443 -m conntrack --ctstate E -j ACCEPT
#3#Open port 9100 for agent_node_exporter
iptables -A OUTPUT -p tcp --dport 9100 -m conntrack --ctstate N,E -j ACCEPT
iptables -A INPUT  -p tcp --sport 9100 -m conntrack --ctstate E -j ACCEPT

#[Default POLICIES]
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#Saving rules:
netfilter-persistent save