#!/bin/bash

#  Bracket notation for positional parameters leads to a fairly 
#+ simple way of referencing the last argument passed to a script
#+ son the command-line. 
#+ This  also requires indirect referencing.

args=$#            # Number of args passed
lastarg=${!args}   #
# Note: This is an *indirect reference* to $args ...

# or: lastarg=${!#}  
# This is an *indirect reference* to the $# variable.
# Note that lastarg=${!$#} doesn't work.
