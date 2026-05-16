#!/bin/bash
# pick_card.sh

# This is an example of choosing random elements of an array.

# Pick a card, any card.
Suites="Clubs
Diamonds
Hearts
Spades"

Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"

# Note variables spread over multiple lines.

suite=($Suites)  # Read into array variables
denomination=($Denominations)

num_suites=${#suite[*]} # count how many elements
num_denominations=${#denomination[*]}

# echo -n "${denomination[$((RANDOM % num_denominations))]} of "
# echo ${suite[$((RANDOM % num_suites))]}
i=$((RANDOM % num_denominations))
j=$((RANDOM % num_suites))

echo "${denomination[i]} of ${suite[j]}"

exit 0