#!/bin/bash
set -xueC

dir=${1:-$(pwd)}

echo $dir
listdir=$(find ${dir} -maxdepth 1 -type d)

if [ ! -d ${dir} ]; then
  echo "引数にはディレクトリを指定してください。"
  exit 1
fi

for i in $(find ${dir} -maxdepth 1 -type d)
do
  if [ $(ls -a ${i} | wc -l) -eq 2 ]; then  # 隠しフォルダに対応
    echo " $i は空ファイルです。削除しますか。(y/n)"
    read INPUT
    case ${INPUT} in
      y|Y ) echo "rm -r ${i}" ;;
      n|N ) echo "削除処理を中断しました。" ;;
      * ) echo "無効な回答です。" ;;
    esac
    continue
  fi

echo " $i はxxxx"

done
