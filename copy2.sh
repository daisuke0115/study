#!/bin/bash 
set -x
argument=${1:?引数がありません}

conf=/root/etc/copy.conf

# 区切り文字をカンマにして引数で指定されたパラメータを配列に格納
# アスタリスクで展開されないように修正すること
list=($(awk 'BEGIN { FS = "," } \
     $1 == "'"${argument}"'" {print $2,$3}' ${conf}))

echo ${list[@]}
echo ${list[0]}
echo ${list[1]}

if [[ -r ${list[0]} ]]; then
  cp ${list[0]} ${list[1]}
  RC=$?
else
  echo "File does not exist"
  exit 1
fi

if [ $RC -eq 0 ]; then
  echo "COPY OK"
else
  echo "COPY NG"
  exit 1
fi

