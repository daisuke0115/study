#!/bin/bash -x

file_path=${1:?ファイルパスを指定してください}

ls ${file_path} >/dev/null 2>&1 ;RC=$?

if [ ${RC} = 0 ]; then
  echo $(ls ${file_path})
  exit 0
else
  echo "ファイルなし"
  exit 1
fi
