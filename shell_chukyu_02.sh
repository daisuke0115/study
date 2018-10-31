#!/bin/bash
#set -xue
# 初期設定
win=0
los=0

# Main
while [[ ! $win = 2 && ! $los = 2 ]]
do

  echo "じゃんけんぽん！"
  echo "グー：１　チョキ：２　パー：３"
  read INPUT
 
  case $INPUT in
    1 ) player="グー"  ;;
    2 ) player="チョキ"  ;;
    3 ) player="パー"  ;;
    * ) echo "１から３の数字を入力してください。" ; continue ;;
  esac
  echo "自分の手：$player"
  com=$(seq 1 3 | shuf | head -1)
  case $com in
    1 ) echo "コンピュータの手：グー" ;;
    2 ) echo "コンピュータの手：チョキ"  ;;
    3 ) echo "コンピュータの手：パー"  ;;
  esac
  anser=$(($com-$INPUT))  
  echo $anser
  case $anser in
    0 ) echo "あいこ" ;;
    1|-2 ) echo "勝ち"; win=$(($win+1))  ;;
    -1|2 ) echo "負け"; los=$(($los+1))   ;;
    * ) echo "例外処理" ; exit 1 ;;
  esac
done

# 勝敗判定
if [ $win = 2 ]; then
  echo "YOU WIN"
else
  echo "YOU LOSE"
fi
#awk 'BIGIN {srand(); print int(3 * rand()) + 1 }'

