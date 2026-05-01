#!/bin/bash
# find all executable files ending with calc in /bin and /usr/bin

for file in /{,usr/}bin/*calc # Brace expansion
do
  if [ -x "$file" ]
  then
    echo $file
  fi
done
