#!/bin/bash -x
QAPATH=./QA
echo "" > ./tmp.txt
ls $QAPATH > ./tmp.txt
COUNT=$(cat ./tmp.txt|wc -l)
random=$(( (RANDOM % $COUNT) + 1 ))
echo $random
qa=$(sed -n ${random}p ./tmp.txt)
./qa.sh $qa
