#!/bin/bash -x
# ファイルシステムの常時監視
# usege:
# listfile:対象マウントポイント
# interval:監視間隔
# count:監視回数
#
########################### 
listfile=/tmp/listfile.txt
interval=${1:-900}
count=${2:-10}
warring=80
error=90

while [ $count -gt 0 ]
do
  while read FS
  do
    i=`df $FS | grep $FS | awk '{print $5}' | sed 's/%//'` 
    if [ $i -ge $error ] ;then
      echo "$FS ${i}% now ${error}% over"
      continue
    fi
    if [ $i -ge $warring ] ;then
      echo "$FS ${i}% now ${warring}% over"
    fi
  done < ${listfile}
  sleep ${interval}
  count=$(($count - 1))
done
