#!/bin/bash

args=$#            # Number of args passed
lastarg=${!args}   #
# Note: This is an *indirect reference* to $args ...

# or: lastarg=${!#}  
# This is an *indirect reference* to the $# variable.
# Note that lastarg=${!$#} doesn't work.
