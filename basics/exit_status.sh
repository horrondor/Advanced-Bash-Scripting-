#!/bin/bash
# checking exit status 
# exit status 0 = command succeeded , Non-zero= failure
# After condition checking if true then $? is 0
#+ Becouse 0 means command executed successfully.

(( 0 && 1 ))               # Logical and
echo $?
# And so ....
let "num = (( 0 && 1 ))"
echo $num                  # O/p: 0
# But ... 
let "num = (( 0 && 1 ))"
echo $?  # o/p: 1 because command executed successfully


(( 200 || 100 ))   # logical OR
echo $?    # 0
# ....
let "num = (( 200 || 100 ))"
echo $num   #1
let "num = (( 200 || 100 ))"
echo $?    # o/p: 0


(( 200 | 100 ))  # Bitwise OR
echo $?          # 0
# ...
let "num = (( 200 | 11 ))"
echo $num   # o/p: 203
let "num = (( 200 | 11 ))"
echo $?     # 0 

# The let construct returns the same exit status
#+ as the double-parenthesis arithemetic expansion.

# Again, note that the exit status of an arithmetic expression is not an error value

var=-2 $$ (( var+=2 ))
echo $? # 1
