#!/bin/bash
# onelinerシェルを記載

#ディレクトリ一覧をCSV形式で吐き出す
find / -maxdepth 1 -type d -exec ls -ld {} \; |awk '{print $9","$1","$3","$4}'

