#!/bin/bash 
set -x
argument=${1:?引数がありません}

conf=/root/etc/copy.conf

# アスタリスクで展開されないように修正
list=$(grep ^${argument} ${conf} | awk -F "," '{print $2}')
echo ${list}
list2=$(grep ^${argument} ${conf} | awk -F "," '{print $3}')

for i in $(echo ${list}); do
  if [[ -r ${i} ]]; then
    cp ${i} ${list2}
    RC=$?
      if [ $RC -eq 0 ]; then
        echo "COPY OK"
      else
        echo "COPY NG"
        exit 1      
      fi
  else
    echo "File does not exist"
    exit 1
  fi
done

