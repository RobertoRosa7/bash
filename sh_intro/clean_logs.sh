#!/bin/bash

# Clean up - script to clean up the log file in /var/logcle
# Run as root
cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp

echo "Logs cleaned up!"