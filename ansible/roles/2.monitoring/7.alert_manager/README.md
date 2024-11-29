# Alertmanager Installation Role

This role sets up Alertmanager, which handles alerts sent by Prometheus and manages notifications.

## Tasks Overview

### 1. Create Alertmanager Directory
- Creates a directory at `/etc/alertmanager` for storing Alertmanager configuration files.

### 2. Copy Alertmanager Configuration File
- Copies the `alertmanager.yml` configuration file to the server at `/etc/alertmanager/alertmanager.yml`, ensuring it has the correct permissions.

### 3. Copy Alertmanager Installation Script
- Copies the `alertmanager.sh` installation script to the server at `/tmp/alertmanager.sh` and makes it executable.

### 4. Run Alertmanager Installation Script
- Executes the Alertmanager installation script to set up Alertmanager on the server.

### 5. Restart Prometheus Service
- Restarts the Prometheus service to apply the new configuration and ensure it recognizes Alertmanager.

## Usage

1. Ensure the `alertmanager.yml` and `alertmanager.sh` scripts are available in the specified locations.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up Alertmanager.
