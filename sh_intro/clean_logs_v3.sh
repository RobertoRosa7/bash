#!/bin/bash

# Clean up Logs
# Run as root

# Warning
# -------
# This script uses quite a number of features that will be explained

LOG_DIR=/var/log
ROOT_UID=0   # only users with $UID 0 have root privileges
LINES=50     # default lines of saved
E_XCD=66     # can't change direcoty
E_NOTROOT=67 # Non-root exit error

if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "Must be root to run this script"
    exit $E_NOTROOT
fi

# check if command line argument present (non-empty)
if [ -n "$1" ]; then
    lines=$1
else
    lines=$LINES # default is not specified on command line
fi

cd $LOG_DIR

if [ "$PWD" != "$LOG_DIR" ]; then
    echo "can't change to $LOG_DIR"
fi

tail -$lines messages >mesg.temp # Saves last section of message log file.
mv mesg.temp messages            # Becomes new log directory.

# cat /dev/null > messages
#* No longer needed, as the above method is safer.

cat /dev/null >wtmp #  ': > wtmp' and '> wtmp'  have the same effect.
echo "Logs cleaned up."

exit 0
#  A zero return value from the script upon exit
#+ indicates success to the shell.
