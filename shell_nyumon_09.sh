#!/bin/bash
i=1
while [ $i -le 100 ]; do
  echo "$i 回目"
  i=$(( i + 1 ))
done
