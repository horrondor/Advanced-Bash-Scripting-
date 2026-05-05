#!/bin/bash

List="one two three"

for a in $List # Splits the variable in parts at whitespace
do 
  echo "$a"
done
# Output
# one
# two
# three

echo "------------"

for a in "$List" # Preserves Whitespace in a single variable
do
  echo "$a"
done
# one two three