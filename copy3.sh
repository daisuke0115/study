#!/bin/bash 
set -x
argument=${1:?引数がありません}

conf=/root/etc/copy.conf

# アスタリスクで展開されないように修正
list=$(grep ^${argument} ${conf} | awk -F "," '{print $2}')
list2=$(grep ^${argument} ${conf} | awk -F "," '{print $3}')
list4=$(grep ^${argument} ${conf} | awk -F "," '{print $4}')

# アスタリスクがある場合のコピー先のパラメータ不正チェック
if [[ `echo "${list}" | grep \*` && ! -d ${list2} ]]; then
  echo "アスタリスクを使用する場合はコピー先をディレクトリで指定してください。"
  exit 1
fi

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

