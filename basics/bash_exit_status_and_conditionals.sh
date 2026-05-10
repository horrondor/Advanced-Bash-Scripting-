#!/bin/bash
if cmp a b &> /dev/null # suppress output
then
  echo "files a and b are identical."
else 
  echo "files a and b differ"
fi

# The very useful "if-grep" construct:
# ------------------------------------
if grep -q Bash ./integer_string.sh
then 
  echo "File contains at least one occurrence of Bash."
fi


word=Linux
letter_sequence=inu
if echo "$word" | grep -q "$letter_sequence"
# The "-q" option to grep suppresses output.
then
  echo "$letter_sequence found in $word"
else
  echo "$letter_sequence not found in $word"
fi

<<'comment'
if COMMAND_WHOSE_EXITS_STATUS_IS_0_UNLESS_ERROR_OCCURED
then 
  echo "Command succeeded."
else
  echo "Command failed." 
fi    
comment