#!/bin/bash 
# $1 識別子を指定
set -x
argument=${1:?引数がありません}

conf=/root/etc/copy.conf

# アスタリスクで展開されないように修正
list=$(grep ^${argument} ${conf} | awk -F "," '{print $2}')
list2=$(grep ^${argument} ${conf} | awk -F "," '{print $3}')
list4=$(grep ^${argument} ${conf} | awk -F "," '{print $4}')

if [[ ! -d ${list2} && -d ${list2%/*} ]]; then
else
  if [[ $(cat ${list} |wc -l) -lt 1 ]]
fi

for i in $(echo ${list:-null}); do #不正な引数対策でechoで展開。
  if [[ -r ${i} && -d ${list2%/*} ]]; then
# コピー先の不正チェック 
    if [[ ! -d ${list2} && -d ${list2%/*} ]]; then
      cp ${i} ${list2}
      RC=$?
        if [ $RC -eq 0 ]; then
          echo "COPY OK"
        else
          echo "COPY NG"
          exit 1      
        fi
    else
      echo ""
    fi
  else
    if [[ ${list4} = cal ]]; then
      echo "Calender File does not exit. Normal End."
      exit 0
    else
      echo "File does not exist. Abnormal End."
      exit 1
    fi
  fi
done

