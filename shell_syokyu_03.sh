#!/bin/bash

#########################################
# シェル名: shell_syokyu_03.sh
# 機能    : ファイル名小文字変換処理
# 引数    : なし
# リスト
# 履歴    : 2018/10/20　新規作成
#########################################
set -xu

# 変数代入
dirpath=$1

# ディレクトリ存在確認 
if [ ! -d ${dirpath} ]; then
  echo "引数にディレクトリを指定してください。"
  exit 1
fi

# リネーム処理
#find ${dirpath} -type f -exec echo {} \; | tr A-Z a-z
find ${dirpath} -maxdepth 1 -type f | while read FULL_PATH
do
  FILENAME=`basename ${FULL_PATH}`
  FILENAME_AFTER=`echo ${FILENAME} | tr [:upper:] [:lower:]`

  if [ ${FILENAME} = ${FILENAME_AFTER} ]; then
    continue
  fi

  echo "${FILENAME} => ${FILENAME_AFTER}"
done
