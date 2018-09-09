#!/bin/bash -x 
nn=${1:-9}
num=$(seq 10 99 | shuf| head -1)
num2=$(seq 1 $nn | shuf | head -1)
echo "$num x $num2 =?"
read INPUT
ANSWER=$(( $num * $num2 ))
echo $ANSWER
#if (( $INPUT == $num * $num2 )) ; then
if (( $INPUT == $ANSWER )) ; then
   echo SEIKAI
else
   echo X $ANSWER
fi
