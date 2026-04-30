#!/bin/bash
# An enhanced and egeneralized version of clean scripts
# Cleanup, version 3

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
#+ as a better way of checking command-line arguements,
#+ but this is still a bit advanced for this stage of the tutorial.
#
# E_WRONGARGS=85 # Non-numerical arguement (bad arguement format)
# case "$1" in
# ""      ) lines=50
# *[!0-9]*) echo "Usage: `basename $0 ` lines-to-cleanup"
#  exit $E_WRONGARGS;;
# *        ) lines=$1;;
# esac
#
#* Skip ahead to loops" chapter to decipher all this

cd $LOG_DIR
if [ `pwd` != "$LOG_DIR" ] # or if [ "$PWD" != "$LOG_DIR" ]
then
  echo "Can't change to $LOG_DIR."
  exit $E_XCD
fi # Doublecheck if in right directory before messing with log file.


# Far more efficient is:
# 
# cd /var/log || {
# echo "Cannot change to necessary directory" >&2
# exit $E_XCD 
#}

tail -n $lines messages > mesg.temp # Save last section of message log file.
mv mesg.temp messages

# cat /dev/null > messages
#* No longer needed, as the above method is safer.

cat /dev/null > wtmp # ':> wtmp' and '> wtmp' have the same effect.
echo "Log files cleaned up."
# Note that there are other log files in /var/log not affected
#+ by this script

exit 0
# A zero return value from the script upon exit indicates success
#+ to the shell.
