#!/bin/bash
# math drill shell 
# usage: mathdrill.sh $1 $2
# $1 The number of questions
# $2 digit
#set -eu #エラー時のシェル停止と未定義引数の確認
num_q=${1:-10}
c=1 # loop count
start_time=$(date +%s)
temp_file=$(mktemp)
export temp_file

# Main
while (( c <= $num_q )) ;do
  ./calculation.sh $2
  c=$(( c+1 ))
done

a=$(cat $temp_file | wc -l)
rate=$(( $a * 100 / $num_q ))
echo "Accuracy rate:$rate% ($a/$num_q)"
end_time=$(date +%s)
total_time=$(( $end_time - $start_time ))
echo "TotalTime:$total_time sec"

trap "rm -f $temp_file" 0
