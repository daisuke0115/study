#!/bin/bash
set -xue
win=0
los=0
while [[ ! $win = 2 && ! $los = 2 ]]
do

  echo "じゃんけんぽん！"
  echo "グー：１　チョキ：２　パー：３"
  read INPUT
 
  case $INPUT in
    1 ) player="グー"  ;;
    2 ) player="チョキ"  ;;
    3 ) player="パー"  ;;
  esac
  echo "自分の手：$player"
  com=$(seq 1 3 | shuf | head -1)
  case $com in
    1 ) echo "コンピュータの手：グー" ;;
    2 ) echo "コンピュータの手：チョキ"  ;;
    3 ) echo "コンピュータの手：パー"  ;;
  esac
  anser=$(($com-$INPUT))  
  case $anser in
    0 ) echo "あいこ" ;;
　　1|-2 ) echo "勝ち"; win=$(($win+1))  ;;
    -1|2 ) echo "負け"; los=$(($los+1))   ;;
  esac
done
if [ $win = 2 ]; then
  echo "YOU WIN"
else
  echo "YOU LOSE"
fi
#awk 'BIGIN {srand(); print int(3 * rand()) + 1 }'

