#!/bin/bash

# Check current SELinux status
CURRENT_STATUS=$(getenforce)
echo "Current SELinux status: $CURRENT_STATUS"

# Disable SELinux temporarily (until reboot)
if [ "$CURRENT_STATUS" != "Disabled" ]; then
    echo "Disabling SELinux temporarily..."
    setenforce 0
fi

# Disable SELinux permanently
CONFIG_FILE="/etc/selinux/config"

if [ -f "$CONFIG_FILE" ]; then
    echo "Disabling SELinux permanently in $CONFIG_FILE..."
    sed -i 's/^SELINUX=.*/SELINUX=disabled/' $CONFIG_FILE
else
    echo "SELinux config file not found at $CONFIG_FILE."
    exit 1
fi

# Verify changes
echo "Updated SELinux configuration:"
grep "^SELINUX=" $CONFIG_FILE
echo "Reboot the system to apply permanent changes."
