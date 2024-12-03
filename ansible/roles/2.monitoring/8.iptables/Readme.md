# iptables Configuration Role

This role installs the `iptables-persistent` package and applies custom firewall rules.

## Tasks Overview

### 1. Install iptables-persistent Package
- Installs the `iptables-persistent` package to ensure firewall rules persist across reboots.
- Updates the APT package index before installation.

### 2. Apply iptables Rules
- Executes the `firewall-rules.sh` script to apply the specified iptables rules to the server.

## Usage

1. Ensure the `firewall-rules.sh` script is available and contains the desired iptables rules.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up iptables.
