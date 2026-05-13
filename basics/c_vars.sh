#!/bin/bash
# c-vars.sh
# Manipulating a variable, C-style, using the ((...)) construct
# x=7
# x++	use 7, then make 8 (post-increment)
# ++x	make 8, then use 8 (pre-increment)


#((...))  --best for integers
# [[...]] --best for regex and other tasks


# ** exponentiation
# a=5**3  o/p: 5*5*5=125

echo (( a= 23 )) # setting a value, C-style
                 #+ with spaces on both sides of the "="

echo "a (initial value) = $a" #23

(( a++ ))        # Post-increment 'a', C-style.
echo "a (after a++) = $a"  #24

(( a-- ))        # Post-decrement 'a', C-style.
echo "a (after a--) = $a"  #23

(( ++a ))         # pre-increment 'a', C-style.
echo "a (after ++a) = $a " # 24

(( --a ))
echo "a (after --a) = $a " # 23

echo 
echo "========================================="
#  Note that, as in C, pre- and post-decrement operators
#+ have different side-effects.

n=1; let --n && echo "True" || echo "False"  # False
n=1; let n-- && echo "True" || echo "False"  # True

echo 

(( t = a<45?7:11 ))  # C-style trinary operator.
#       ^  ^ ^
echo "If a < 45, then t = 7, else t = 11."  # a = 23
echo "t = $t "                              # t = 7

echo


