#!/bin/bash
i=1
while [ $i -le 100 ]; do
  echo "$i 回目"
  i=$(expr $i + 1)
done
