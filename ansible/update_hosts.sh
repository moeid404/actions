#!/bin/bash

# Ensure jq is installed
if ! command -v jq &>/dev/null; then
  echo "jq is not installed. Installing..."
  sudo apt-get update && sudo apt-get install -y jq
fi

# Define file paths
TERRAFORM_OUTPUT="terraform/terraform-output.json"
HOSTS_FILE="ansible/hosts.ini"

# Extract IPs using jq
AGENT_PUBLIC_IP=$(jq -r '.agent_public_ip.value' "$TERRAFORM_OUTPUT")
PROMETHEUS_PUBLIC_IP=$(jq -r '.prometheus_public_ip.value' "$TERRAFORM_OUTPUT")

# Check for errors in IP extraction
if [[ -z "$AGENT_PUBLIC_IP" || -z "$PROMETHEUS_PUBLIC_IP" ]]; then
  echo "Error: Unable to extract IP addresses from Terraform output."
  exit 1
fi

# Debug outputs
echo "Agent Public IP: $AGENT_PUBLIC_IP"
echo "Prometheus Public IP: $PROMETHEUS_PUBLIC_IP"

# Create or overwrite the hosts.ini file
echo "[agent]" > "$HOSTS_FILE"
echo "$AGENT_PUBLIC_IP" >> "$HOSTS_FILE"
echo "[prometheus_server]" >> "$HOSTS_FILE"
echo "$PROMETHEUS_PUBLIC_IP" >> "$HOSTS_FILE"
echo "[all:vars]" >> "$HOSTS_FILE"
echo "ansible_user=ubuntu" >> "$HOSTS_FILE"

# Debug the resulting hosts.ini file
echo "Updated $HOSTS_FILE:"
cat "$HOSTS_FILE"
