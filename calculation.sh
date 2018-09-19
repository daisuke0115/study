#!/bin/bash
nn=${1:-9} # 未入力時は1桁とする
num=$(seq 10 99 | shuf| head -1) # ランダムな数字を取得
num2=$(seq 1 $nn | shuf | head -1)
temp_file=${temp_file:=/dev/null} # 単独実施時は/tmpを使用しない

# Main
echo "$num x $num2 =?"
read INPUT
ANSWER=$(( $num * $num2 ))
if (( ${INPUT:-0} == $ANSWER )) ; then
   echo SEIKAI | tee -a $temp_file
else
   echo X $ANSWER
fi
