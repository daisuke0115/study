#!/bin/bash
set -xu

arug=$1
if [ ! $# -eq 1 ]; then
  echo "引数は１つ指定してください"
  exit 1
fi

case $arug in
  [A-Z])
    echo "アルファベット大文字"
    ;;
  [a-z])
    echo "アルファベット小文字"
    ;;
  *)
    echo "アルファベットか数字1字を指定してください"
    ;;
esac
