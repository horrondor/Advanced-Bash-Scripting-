#!/bin/bash
# The "continue N" command, continuing at the Nth level loop.

for outer in I II III IV V  # outer loop
do
  echo
  echo -n "Group $outer: "
  # --------------------------------
  for inner in 1 2 3 4 5 6 7 8 9 10 # inner loop
  do
    if [[ "$inner" -eq 7 && "$outer" = "III" ]]
    then
    #   continue 2 
    break 2
    fi
    echo -n "$inner"
  done
done

<< comment
o/p of continue 2:
Group I: 12345678910
Group II: 12345678910
Group III: 123456
Group IV: 12345678910
Group V: 12345678910
comment

<< comment2
o/p of break 2:
Group I: 12345678910
Group II: 12345678910
Group III: 123456
comment2