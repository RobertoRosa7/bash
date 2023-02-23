#!/bin/bash

# Clean up logs version 2
# Run as root

LOG_DIR=/var/log
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

echo "logs cleaned up!"
exit