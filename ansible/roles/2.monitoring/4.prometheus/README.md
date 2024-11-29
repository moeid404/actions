# Prometheus Installation and Configuration Role

This role installs Prometheus, configures its settings, and ensures the service is running.

## Tasks Overview

### 1. Copy Prometheus Installation Script
- Copies the `install_prometheus.sh` script to the server at `/tmp/install_prometheus.sh` and makes it executable.

### 2. Run Prometheus Installation Script
- Executes the Prometheus installation script to set up Prometheus on the server.

### 3. Copy Prometheus Configuration Template
- Copies the `prometheus.yml.j2` template to `/etc/prometheus/prometheus.yml` with appropriate ownership and permissions.

### 4. Copy Alerting Rules Configuration
- Copies the `rules.yml` file to `/etc/prometheus/rules.yml` with the correct permissions.

### 5. Restart Prometheus Service
- Restarts the Prometheus service to apply the new configuration and ensures it is enabled to start on boot.

## Usage

1. Ensure the `install_prometheus.sh`, `prometheus.yml.j2`, and `rules.yml` files are available in the specified locations.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up Prometheus.
