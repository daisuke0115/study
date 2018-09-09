#!/bin/bash -x
QAFILE=./QA/$1
grep -v ANSWER $QAFILE
read INPUT
ANSWER=`awk '/^ANSWER/ {print substr($0,8,length($0))}' $QAFILE`
if [ "$ANSWER" = "$INPUT" ] ; then
	echo SEIKAI
else
	echo X
fi
