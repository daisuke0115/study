#!/bin/bash

date_t=(date +%H%M%S)

#ログ世代管理
mv ~/log/log1.log ~log/log2.log > ~/log/log1.log 2>&1
cat << EOF >> sample.sh 
date_t=(date +%H%M%S)

mv ~/log/log1.log ~/log/log2.log > ~/log/log1.log 2>&1
mv ~/log/log2.log ~/log/log3.log >> ~/log/log1.log 2>&1

#前回分の圧縮
gzip -c ~/data/*.dat >> ~/log/log1.log 2>&1

#データファイルの作成
df > ~/data/.dat >> ~log/log1.log 2>&1

