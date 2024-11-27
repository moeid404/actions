#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ui/tls.key -out ui/tls.crt -subj "/CN=nodeapp.com/O=nodeapp.com"
kubectl create secret tls nodeapp-tls --cert=ui/tls.crt --key=ui/tls.key
