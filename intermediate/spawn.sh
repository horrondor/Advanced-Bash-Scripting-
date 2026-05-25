#!/bin/bash
# spawn.sh


PIDS=$(pidof sh $0)  # Process IDs of the various instances of this script.
P_array=( $PIDS )    # Put them in an array 
echo $PIDS           # Show process IDs of parent and child processes.
let "instances = ${#P_array[*]} - 1"  # Count elements, less 1.
                                      
echo "$instances instance(s) of this script running."
echo "[Hit Ctl-C to exit.]"; echo


sleep 1              
sh $0                

exit 0 