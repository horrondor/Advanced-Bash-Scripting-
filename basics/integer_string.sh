#!/bin/bash
# int-or-string.sh

a=2334         # Integer
let "a +=1"    
echo "a = $a " # a = 2335 
echo           # Integer, still

b=${a/23/BB}   # Substitute "BB" for "23"
               # This transforms $b into a string
echo "b = $b"  # b = BB35
declare -i b   # Declaring it an integer doen't help.
echo "b = $b"  # b = BB35

let "b +=$1"    # BB35 + 1
echo "b = $b"   # b = 1
echo            # Bash sets the "integer value" of a string to 0.

c=BB34 
echo "c = $c"   # c = BB34
d=${c/BB/23}    # Substitute "23" for "BB"
                # This makes $d an ineteger
echo "d = $d"   # d = 2334
echo 

# what about null variables?
e=''            # ...Or e="" ... Or e=
echo "e = $e"   # e =
let "e +=1"     # Arithmetic operations allowwed on a null variables?
echo "e = $e"   # e =1
echo            # Null variable transformed into an integer.

# what about undeclared variable?
echo "f =$f"    # f =
let "f += 1"    # Arithmetic operations allowed?
echo "f = $f"   # f =1
echo            # Undeclared variable transformed into an integer.
#
# However .......
let "f /= $undecl_var" # Divide by zero?
# let: f /= : syntax error: operand expected (error token is "")
# syntax error! Variable $undecl_var is not set to zero here!
#
# But still ...
let "f /= 0"
# let: f /=0: division by 0 (error token is "0")
# Expected behaviour.

# Bash (usually) sets the "integer value" of null to zero 
#+ when peforming an arithmetic operation.
# But, don't try this at home, folks!
# It's undocumented and probably non-portable behavior.

# conclusion: Variables in Bash are untyped,
#+ with all attendant consequences.

exit $?
