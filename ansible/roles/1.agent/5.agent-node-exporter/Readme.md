# Node Exporter and C-Advisor Configuration Role

This role installs Node Exporter, updates Docker daemon settings, and starts C-Advisor using Docker Compose.

## Tasks Overview

### 1. Copy Node Exporter Installation Script
- Copies the `install_node_exporter.sh` script to the server at `/tmp/install_node_exporter.sh` and makes it executable.

### 2. Run Node Exporter Installation Script
- Executes the Node Exporter installation script to set it up on the server.

### 3. Update Docker Daemon Configuration
- Configures the Docker daemon by creating or updating the `/etc/docker/daemon.json` file with settings for metrics and experimental features.

### 4. Copy Docker Compose File
- Copies the `docker-compose.yml` file to the target directory (`/tmp/docker-compose.yml`) with appropriate permissions.

### 5. Start C-Advisor Using Docker Compose
- Uses Docker Compose to start C-Advisor in detached mode, utilizing the configuration specified in the `docker-compose.yml` file.

## Usage

1. Ensure the `install_node_exporter.sh` script and the `docker-compose.yml` file are available in the specified locations.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to set up Node Exporter and C-Advisor.
