# Grafana Installation and Configuration Role

This role installs Grafana, configures its settings, and ensures the service is running.

## Tasks Overview

### 1. Install Required Packages
- Installs necessary packages: `apt-transport-https`, `software-properties-common`, and `wget`.

### 2. Create Directory for APT Keyrings
- Creates a directory at `/etc/apt/keyrings/` for storing GPG keys with appropriate permissions.

### 3. Ensure Sources List Directory Exists
- Ensures the `/etc/apt/sources.list.d/` directory exists for additional APT repository files.

### 4. Download Grafana GPG Key
- Downloads the Grafana GPG key and converts it to a format suitable for APT.

### 5. Add Grafana GPG Key to Keyrings
- Saves the GPG key to `/etc/apt/keyrings/grafana.gpg`.

### 6. Add Grafana APT Repository
- Adds the Grafana APT repository to the sources list for package management.

### 7. Update APT Package Index
- Updates the APT package index to include the newly added Grafana repository.

### 8. Install Grafana
- Installs the latest version of Grafana.

### 9. Configure Grafana Protocol
- Ensures the protocol is set to `http` in the Grafana configuration file.

### 10. Configure Grafana HTTP Port
- Sets the HTTP port to `3000` in the Grafana configuration file.

### 11. Restart Grafana Service
- Restarts the Grafana service to apply the new configuration.

## Usage

1. Ensure the `grafana_protocol` and `grafana_port` variables are defined in your playbook or inventory.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up Grafana.
