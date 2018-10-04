#!/bin/bash -x

if [ -a $1 ]; then
  cp $1 $2
  RC=$?
  if [ $RC -eq 0 ]; then
    echo "OK"
    exit 0
  fi
fi

echo "NG"
exit 1

