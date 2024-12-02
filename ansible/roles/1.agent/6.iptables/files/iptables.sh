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
# Open port 9100 for node_exporter
iptables -A INPUT -p tcp --dport 9100 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 9100 -m conntrack --ctstate E -j ACCEPT
# KIND typically uses port 6443 for the Kubernetes API server. 
sudo iptables -A INPUT -p tcp --dport 6443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 6443 -j ACCEPT

#[Outgoing connection] [Server >> Outside]
#1#HTTP
iptables -A OUTPUT -p tcp --dport 80 -m conntrack --ctstate N,E -j ACCEPT 
iptables -A INPUT -p tcp --sport 80 -m conntrack --ctstate E -j ACCEPT
#2#HTTPS
iptables -A OUTPUT -p tcp --dport 443 -m conntrack --ctstate N,E -j ACCEPT
iptables -A INPUT  -p tcp --sport 443 -m conntrack --ctstate E -j ACCEPT
# KIND typically uses port 6443 for the Kubernetes API server.
sudo iptables -A OUTPUT -p tcp --dport 6443 -j ACCEPT
sudo iptables -A INPUT -p tcp --sport 6443 -j ACCEPT

#[Apply Docker Chains]
sudo systemctl restart docker

#[Default POLICIES]
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#Saving rules:
netfilter-persistent save