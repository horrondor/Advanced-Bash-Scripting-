#!/bin/bash
# string comparision

<< 'comment'
# =  This is assignment operator and not same as ==
if [ "$a" = "$b" ]

Caution	
Note the whitespace framing the =.

if [ "$a"="$b" ] is not equivalent to the above.

echo "------------------------------------------"


==
if [ "$a" == "$b" ]
This is a synonym for =.

Note:

The == comparison operator behaves differently within a double-brackets test than within single brackets.
[[ $a == z* ]]   # True if $a starts with an "z" (pattern matching).
[[ $a == "z*" ]] # True if $a is equal to z* (literal matching).

[ $a == z* ]     # File globbing and word splitting take place.
[ "$a" == "z*" ] # True if $a is equal to z* (literal matching).
echo "------------------------------------------"

!=
is not equal to

if [ "$a" != "$b" ]

This operator uses pattern matching within a [[ ... ]] construct.

echo "--------------------------------------------------------"

<
is less than, in ASCII alphabetical order

if [[ "$a" < "$b" ]]

if [ "$a" \< "$b" ]

Note that the "<" needs to be escaped within a [ ] construct.
echo "-------------------------------------------------"

>
is greater than, in ASCII alphabetical order

if [[ "$a" > "$b" ]]

if [ "$a" \> "$b" ]

Note that the ">" needs to be escaped within a [ ] construct.

echo "----------------------------------------------"

-z
 String is null ,returns true if length of string is zero
string=''
if [ -z "$string" ]
then
  echo "\$string is null"
else
  echo "\$string is not null"
fi  # string is null


echo "--------------------"
# -n  string is not null 
# returns true is string length is non zero

comment

