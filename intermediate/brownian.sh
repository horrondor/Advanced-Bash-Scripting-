#!/bin/bash
# brownian.sh

#  ----------------------------------------------------------------
#  This script models Brownian motion:
#+ the random wanderings of tiny particles in a fluid,
#+ as they are buffeted by random currents and collisions.
#+ This is colloquially known as the "Drunkard's Walk."

#  It can also be considered as a stripped-down simulation of a
#+ Galton Board, a slanted board with a pattern of pegs,
#+ down which rolls a succession of marbles, one at a time.
#+ At the bottom is a row of slots or catch basins in which
#+ the marbles come to rest at the end of their journey.
#  Think of it as a kind of bare-bones Pachinko game.
#  As you see by running the script,
#+ most of the marbles cluster around the center slot.
#+ This is consistent with the expected binomial distribution.
#  As a Galton Board simulation, the script
#+ disregards such parameters as
#+ board tilt-angle, rolling friction of the marbles,
#+ angles of impact, and elasticity of the pegs.
#  To what extent does this affect the accuracy of the simulation?
#  ----------------------------------------------------------------

PASSES=500    #  Number of particle interactions / marbles.
ROWS=10       #  Number of "collisions" (or horiz. peg rows).
RANGE=3       #  0 - 2 output range from $RANDOM.
POS=0         #  Left/right position.
RANDOM=$$     #  Seeds the random number generator from PID
              #+ of script.

declare -a Slots      # Array holding cumulative results of passes.
NUMSLOTS=21           # Number of slots at bottom of board.

Initialize_Slots ()   # Zero out all elements of the array
{
 for i in $( seq $NUMSLOTS )
 do
   Slots[$i]=0
 done
 echo                 # Blank line at beginning of run.
}

Show_Slots ()
{
  echo
  echo -n " "
  for i in $( seq $NUMSLOTS ) # Pretty-print array elements.
  do
    printf "%3d" ${Slots[$i]} # Allot three spaces per result
  done

  echo # Row of slots:
  echo "|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|"
  echo "                             ||"
  echo # Note that if the count within any particular slot exceeds 99,
       #+ it messes up the display,
       # Running only(!) 500 passes usually avoids this.

}

Move ()             # Move one unit right / left, or stay put.
{
    Move=$RANDOM
    let "Move %= RANGE" # Normalize into range of 0-2.
    case "$Move" in
    0 ) ;;                # Do nothing, i.e., stay in place.
    1 ) ((POS--));;       # left.
    2 ) ((POS++));;       # Right.
    * ) echo -n "Error";; # Anamoly! (should never occur)
    esac
}

Play ()                        # Single pass (inner loop)
{
    i=0
    while [ "$i" -lt "$ROWS" ] # One event per row
    do
      Move
      ((i++));
    done

    SHIFT=11
    let "POS += $SHIFT"     # Shift "zero position" to center
    (( Slots[$POS]++ ))

    # echo -n "$POS "
}

Run ()            # Outer loop
{
    p=0
    while [ "$p" -lt "$PASSES" ]
    do
      Play
      (( p++ ))
      POS=0
    done
}

# ------------------------
# main ()
Initialize_Slots
Run
Show_Slots
# -----------------
exit $?