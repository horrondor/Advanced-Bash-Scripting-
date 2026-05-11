#!/bin/bash

# A binary comparison operator compares two variables or quantities. 
#+ Note that integer and string comparison use a different set of operators
# for integer comparision (gt,lt) and for  string (<,=,>=) 

# Read input
read -p "Enter the value of a:" a
read -p "Enter the value of b:" b

#-eq  is equal to 
if [ "$a" -eq "$b" ]
then
  echo "$a is equal to $b"
fi

#-ne  is not equal to
if [ "$a" -ne "$b" ]
then
  echo "$a is not equal to $b"
fi

# -gt  greater than 
if [ "$a" -gt "$b" ]
then
  echo "$a is greater than $b "
fi

# -lt  less than
if [ "$a" -lt "$b"]
then
  echo "$a is less than $b"
fi

# -le less than and equal to
if ["$a" -le "$b"]
then
  echo "$a is less than $b"
fi