#!/bin/bash

a=23    # simple case
echo $a
b=$a
echo $b

# Now, getting a little bit fancier (command substitution)

a=`echo Hello!` # Assigns result of 'echo' command to 'a' ...
echo $a
# Note that including an exclamation mark (!) within a
#+ command substitution construct will not work from the command-line, 
#+ since this triggers the bash "history mechanism."
# Inside a script , however, the history fucntions are disabled by default

a=`ls -l`
echo $a   # Unquoted, however, it removes tabs and newlines
echo 
echo "$a" # The quoted variable preserves whitespace

arch=$(uname -m)
echo "Architecture is :$arch"

exit 0