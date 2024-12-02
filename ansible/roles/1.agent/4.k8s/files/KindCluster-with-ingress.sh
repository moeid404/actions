#!/bin/bash

# Create a Kubernetes cluster with kind and configure ingress ports
kind create cluster --config - <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30300
    hostPort: 30300
  - containerPort: 30081
    hostPort: 30081
  - containerPort: 30082
    hostPort: 30082
EOF



# Apply the ingress-nginx controller configuration
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
