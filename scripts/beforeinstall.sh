#!/bin/bash
if [ ! -d /home/ubuntu/dist ]; then
    echo "Fresh EC2 Instance"
    exit 0
else
    cd /home/ubuntu/dist
    cd /home/ubuntu && sudo rm -rf dist
fi