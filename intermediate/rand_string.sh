#!/bin/bash

# rand_string.sh
# Generating an 8-charcter "random" string

if [ -n "$1" ]  # if command-line arguement present
then            #+ then set start-string to it
  str0="$1"    
else 
  str0="$$"     # Else use PID of script as start-string
fi

POS=2 # Starting from position 2 in the string
LEN=8 # Extract eight characters.

strl=$( echo "$str0" | md5sum | md5sum )
# Doubly scramble 
#+ by piping and repiping to md5sum.

randstring="${strl:$POS:$LEN}"
# Can parameterize ^^^^ ^^^^

echo "$randstring"

exit $?