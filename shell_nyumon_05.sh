#!/bin/bash -x
file_path=${1:?引数にファイルを指定してください。}

if [ -a $file_path ]; then
  echo "ファイルは存在します"
else
  echo "ファイルは存在しません"
fi
