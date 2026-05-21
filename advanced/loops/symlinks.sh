#!/bin/bash
# symlinks.sh : List symbolic liks in a directory

OUTFILE="symlinks.list"

directory=${1:-$(pwd)}

# Deafult to working directory
echo "symbolic links in directoty \"$directory\"" > "$OUTFILE"
echo "---------------------------" >> "$OUTFILE"

for file in "$( find $directory -type l )" # -type l = symbolic links
do
  echo "$file" 
done | sort >> "$OUTFILE"

exit $?