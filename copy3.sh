#!/bin/bash 
#
# usase:$basename $1
# $1: パラメータ名
#
########################
set -x
argument=${1}
conf=/root/etc/copy.conf

# アスタリスクで展開されないように修正
list=$(grep ^${argument} ${conf} | awk -F "," '{print $2}')  # コピー元
list2=$(grep ^${argument} ${conf} | awk -F "," '{print $3}') # コピー先
list4=$(grep ^${argument} ${conf} | awk -F "," '{print $4}') # カレンダーフラグ

# 引数の不正チェック
if [[ $(grep ^${argument} ${conf} | wc -l) -ne 1 ]]; then
  echo "引数は一意になるように指定してください"
  exit 1
fi

# アスタリスクがある場合のコピー先のパラメータ不正チェック
if [[ `echo "${list}" | grep \*` && ! -d ${list2} ]]; then
  echo "アスタリスクを使用する場合はコピー先をディレクトリで指定してください。"
  exit 1
fi

# コピー元ファイルが存在し、コピー先ディレクトリがある場合にコピーを実施 
for i in $(echo ${list}); do
  if [[ -r ${i} && -d ${list2%/*} ]]; then
    cp ${i} ${list2}
    RC=$?
      if [ $RC -eq 0 ]; then
        echo "COPY OK"
      else
        echo "COPY NG"
        exit 1      
      fi
  else
# カレンダーフラグがある場合はコピー元が無くても正常終了とする 
    if [[ ${list4} = cal ]]; then
      echo "Calender File does not exit. Normal End."
      exit 0
    else
      echo "コピー元、またはコピー先のパラメータが不正です。"
      exit 1
    fi
  fi
done
