#!/bin/bash

set -euo pipefail


E_WRONGDIRECTORY=85

clear

TargetDirectory=/home/bozo/projects/GreatAmericanNovel

cd "$TargetDirectory"

echo "Deleting stale files in $TargetDirectory"

if [[ "$PWD" != "$TargetDirectory" ]]
then
  echo "Wrong Directory"
  echo "In $PWD, rather than $TargetDirectory"  
  echo "Bailing out!!!!!"
  exit $E_WRONGDIRECTORY
fi

rm -rf -- *
#rm .[A-Za-z0-9]* #Deletefiles
rm -rf .[^.]* ..?* 2>/dev/null || true # to remove filenames begining with multiple dots.
# (shopt -s dotglob; rm -rf *) will also work.

# A filename (`basename`) may contain all characters in the 0 - 255 range,
#+ except "/"
# Deleting files begining with weird charcters, such as - 
#+ is left as an exercise

result=$?

ls -al
echo "Done"
echo "Old files deleted in $TargetDirectory."
echo

exit $result