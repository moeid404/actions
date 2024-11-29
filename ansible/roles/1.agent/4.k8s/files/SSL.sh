#!/bin/bash

set -e  # Exit on any error

# Ensure /opt/cert directory exists
mkdir -p /opt/cert

# Generate SSL certificate and key
echo "Generating SSL certificate and key..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /opt/cert/tls.key -out /opt/cert/tls.crt \
  -subj "/CN=nodeapp.com/O=nodeapp.com"

# Create Kubernetes secret
echo "Creating Kubernetes secret..."
kubectl create secret tls nodeapp-tls \
  --cert=/opt/cert/tls.crt --key=/opt/cert/tls.key

echo "Secret 'nodeapp-tls' created successfully."
