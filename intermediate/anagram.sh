#!/bin/bash
# anagram.sh
# Example of nested command substitution.

# Uses "anagram" utility
#+ that is part of the author's "yawl" word list package.
#  http://ibiblio.org/pub/Linux/libs/yawl-0.3.2.tar.gz
#  http://bash.deta.in/yawl-0.3.2.tar.gz

E_NOARGS=86
E_BADARG=87
MINLEN=7

if [[ -z "$1" ]]
then
  echo -n "Usage $0 LETTERSET"
  exit E_NOARGS              # script needs a command line arguement
elif [[ ${#1} -lt $MINLEN ]] 
then
    echo "Arguement must have at least $MINLEN letters." 
    exit $E_BADARG
fi

FILTER='.......'  # Must have at least 7 letters
#       1234567
Anagrams=( $(echo $(anagram $1 | grep $FILTER) ) )
#          $(     $(  nested command sub.    ) )
#        (              array assignment         )

echo
echo "${#Anagrams[*]}" 
echo
echo ${Anagrams[0]}    # First anagram
echo ${Anagrams[1]}    # Second anagram.

# echo "${Anagrams[*]}" # To list all the anagrams in a single line .

exit $?