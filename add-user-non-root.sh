#!/bin/bash
read -p "Please input user non root:" user

mkdir -p /home/$user/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/$user/.kube/config
sudo chown -R $user:$user /home/$user/.kube

if ! grep -q "alias k=kubectl" ~/.bashrc; then
    echo "Menambahkan alias 'k=kubectl' ke ~/.bashrc"
    echo "alias k=kubectl" >> ~/.bashrc
    source ~/.bashrc
else
    echo "Alias 'k=kubectl' sudah ada di ~/.bashrc"
fi