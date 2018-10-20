#!/bin/bash
set -xu

listfile=../etc/copy.conf

if [ ! -f ${listfile} ]; then
  echo "リストファイルがありません"
  exit 1
fi

while read VARUE; do
  echo ${VARUE}
done < ${listfile}

