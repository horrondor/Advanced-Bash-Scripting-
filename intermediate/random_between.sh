#!/bin/bash
# random-between.sh
# Random number between two specified values

randomBetween()
{
    # Generates a positive or negative random number
    #+ between $min and $max
    #+ and divisible by $divisibleBy.
    # Gives a "reasonably random" distrubution of return values.

   syntax()
   {
    # Function embedded within the function
    echo 
    echo "Syntax: randomBetween [min] [max] [multiple]"
    echo
    echo -n "Expects up to 3 passed parameters, "
    echo "but all are completely optional."
    echo "min is the minimum value"
    echo "max is the maximum value"
    echo -n "multiple specifies that the answer must be "
    echo "a multiple of this value."
    echo "i.e answer must be evenly divisible by this number."
    echo "If any value is missing, defaults area supplied as: 0 32767 1"
    echo -n "Successful completion returns 0,"
    echo "The answer is returned in the global variable"
    echo "randomBetweenAnswer"
    echo -n "Negative values for any passed parameter are "
    echo "handled correctly"
   }

   local min=${1:-0} # use $1 is empty initialize 0
   local max=${2:-32767}
   local divisibleBy=${3:-1}
   # Default values assigned, incase parameters not passed to function

   local x
   local spread

   # let's make sure the divisibleBy value is positive.
   [ ${divisibleBy} -lt 0 ] && divisibleBy=$((0-divisibleBy))

   # Sanity check
   if [ $# -gt 3 -o ${divisibleBy} -eq 0 -o ${min} -eq ${max} ]
   then
     syntax
     return 1
   fi

   # see if the min and max are reversed
   if []
   then
     
   fi
}