#!/bin/bash
set -xueC

dir=${1:-$(pwd)}

echo $dir

if [ ! -d ${dir} ]; then
  echo "引数にはディレクトリを指定してください。"
  exit 1
fi

while read i
do
  echo "${i}を削除します。"
  if [ ! $? -eq 0 ];then
    echo "Error"
  fi
done < <(find ${dir} -maxdepth 1 -type d -empty) 


