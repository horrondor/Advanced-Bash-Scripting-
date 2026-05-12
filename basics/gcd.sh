#!/bin/bash
# gcd.sh: greatest common divisor
#         Uses Euclid's algorithm

#  The "greatest common divisor" (gcd) of two integers
#+ is the largest integer that will divide both, leaving no remainder.

#  Euclid's algorithm uses successive division.
#    In each pass,
#+      dividend <---  divisor
#+      divisor  <---  remainder
#+   until remainder = 0.
#    The gcd = dividend, on the final pass.

# ----------------------------------------------------
# Arguement check
ARGS=2
E_BADARGS=85
E_BADINTS=86

if [ $# -ne "$ARGS" ]
then
  echo "Usage: `basename $0` first-number second-number"
  exit $E_BADARGS
fi
# -------------------------------------------------------

if ! [[ "$1" =~ ^-?[0-9]+$ && "$2" =~ ^-?[0-9]+$ ]];
then
  echo "Error: Arguements must be integers"
  exit $E_BADINTS
fi

# --------------------------------------------------------

gcd ()
{
    local dividend=$1    # Arbitary assignment
    local divisor=$2     #! It doesn't matter which of the two is larger.
                         # why not?   
    local remainder=1    #  If an uninitialized variable is used inside
                         #+ test brackets, an error message results.               
     
    until [ "$remainder" -eq 0 ];
    do
      let "remainder = $dividend % $divisor"
      dividend=$divisor    # Now repeats with 2 smallest numbers 
      divisor=$remainder
    done                    # last $divident is the gcd
    echo "$dividend"
}

result=$(gcd "$1" "$2")
echo
echo; echo "GCD of $1 and $2 = $result";
echo
exit 0