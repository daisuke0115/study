#!/bin/bash
# onelinerシェルを記載

#ディレクトリ一覧をCSV形式で吐き出す
#awk -v OFS=","でも区切り文字は変更可能
find / -maxdepth 1 -type d -exec ls -ld {} \; |awk '{print $9","$1","$3","$4}'

