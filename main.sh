#!/bin/bash

echo "1) Reset & Clean Cluster"
echo "2) Reset Tronton"
echo "4) Create Kube Config for New User non User"
echo "5) quit"

read -p "Please select a menu option: " choice

RAW_URL=https://raw.githubusercontent.com/ilham-suyadi/tronton-shell/main

case $choice in
    1) curl -sL $RAW_URL/remove-apps.sh | bash;;
    2) curl -sL $RAW_URL/reset-tronton | bash;;
    5) curl -sL $RAW_URL/add-user-non-root.sh | bash ;;
    4) echo "Goodbye!"; exit 0;;
    *) echo "Oops, Invalid choice";;
esac