#!/bin/bash
# Update host name
read -p "Specify laptop number:" HOST_NUM; sudo sh -c "echo 'debian-shrimp-${HOST_NUM}' > /etc/hostname"
