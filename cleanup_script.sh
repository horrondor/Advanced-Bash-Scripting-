#!/bin/bash
# An enhanced and egeneralized version of clean scripts

LOG_DIR=/var/log
ROOT_UID=0   # Only users with $UID 0 have root privileges
LINES=50     # Default number of lines saved
E_XCD=86     # Can't change directory
E_NOTROOT=87 # Non-root exit root

# Run as root
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

if [ -n "$1" ]
# Test whether command-line arguement is present (non-empty)
then
  lines=$1
else
  lines=$lines # Default, if not specified on command-line    
fi

# Stephane Chazelas suggets the following
#+ as a 