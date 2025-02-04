#!/bin/bash

# Reset kubeadm
kubeadm reset -f

# Remove specified directories and files
rm -rf /etc/tronton/state
rm -f /etc/keepalived/*
rm -rf /etc/haproxy/*
rm -f ~/.kube/config

# Remove container images using containerd (ctr)
ctr -n k8s.io i rm botramcr.solusi247.com/sdo/product/tronton/registry/kube-controller-manager:v1.28.13
ctr -n k8s.io i rm botramcr.solusi247.com/sdo/product/tronton/registry/kube-scheduler:v1.28.13

echo "Cleanup completed successfully."