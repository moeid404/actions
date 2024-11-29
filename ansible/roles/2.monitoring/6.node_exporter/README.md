# Node Exporter Installation Role

This role installs Node Exporter, which is used to monitor the system metrics of a server.

## Tasks Overview

### 1. Copy Node Exporter Installation Script
- Copies the `install_node_exporter.sh` script to the server at `/tmp/install_node_exporter.sh` and makes it executable.

### 2. Run Node Exporter Installation Script
- Executes the Node Exporter installation script to set up Node Exporter on the server.

## Usage

1. Ensure the `install_node_exporter.sh` script is available in the specified location.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up Node Exporter.
