#!/bin/bash
# weird_vars.sh: Echoing weird variables

# echo "$vars" 
# $vars expands and display actual  
#+ value that it stored 
#+ called variable expansion  

echo 

var="'(]\\{}\$\)""
echo $var         # '(]\{}$"
echo "$var"       # '(]\{}$" Doesn't make a difference.

echo 

IFS='\'           # Internal field selector (it uses \ as delimiter 
                  #+ so \ is converted to space )
echo  $var        # '(] {}$" \ Converted to space. Why?
echo "$var"       # '(]\{}$"

# Another example

echo

var2="\\\\\""
echo $var2       #     " Without quoting everthing 
                 #+ is converted to space effected by IFs
echo "$var2"     # \\" Not effected by IFS
echo
# But .... var2="\\\\"" is illegal. why?
var3='\\\\'
echo "$var3"     # \\\\
# Strong quoting works, though

# *************************************#
# As the first example above shows, nesting quotes is permitted.

echo "$(echo '"')"
#    ^           ^

# At times this comes in useful.

var1="Two bits"
echo "\$var1 = "$var1"" # $var1 = Two bits
#    ^                ^

# Or 

My_file1="./shift.sh"
My_file2="./shift-past.sh"

size1=$(du -b "$My_file1" | cut -f1)
size2=$(du -b "$My_file2" | cut -f1)

if [ "$size1 -gt $size2"  ]
# if [ "$(du "$My_file1") -gt $(du "$My_file2")" ]
then
  echo "$My_file1 has greater disk usage which is $size1"
fi