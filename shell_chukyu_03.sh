#!/bin/bash
set -x
if [ $# -eq ]; then
  echo "引数を入力してください"
  exit 1
fi

if [[ ${1} = "-t" ]]; then
  if [ ! ${#2} -eq 14 ]; then
    echo "引数が間違っています"
    echo "実行方法：$0 -t YYYYMMDDHHMMSS"
    exit
  fi

  YEAR=$(echo $2 | cut -c 1-4)
  MONTH=$(echo $2 | cut -c 5-6)
  DAY=$(echo $2 | cut -c 7-8)
  HOUR=$(echo $2 | cut -c 9-10)
  MIN=$(echo $2 | cut -c 11-12)
  SEC=$(echo $2 | cut -c 13-14)
  START_UNIX_TIME=$(date +%s)
  END_UNIX_TIME=$(date -d "${YEAR}/${MONTH}/${DAY} ${HOUR}:${MIN}:${SEC}" +%s)
  COUNTDOWN_TIME=$(expr ${END_UNIX_TIME} - ${START_UNIX_TIME})
else
  COUNTDOWN_TIME=$1
fi

TMPDIR=/tmp
TMPFILE=$(mktemp ${TMPDIR}/countdown.tmp_XXXX)
PGM_STOP_TIME=$(expr ${COUNTDOWN_TIME} + 3)

#trap "rm -f ${TMPFILE}" 0 1 2 3 4 5 6 8 9 11 15

echo ${COUNTDOWN_TIME} > $TMPFILE

$(sleep ${PGM_STOP_TIME};PID=$(ps -ef |grep "watch -n 1 -t" |grep -v grep |awk '{print $2}');kill ${PID}) &

watch -n 1 -t "\
  CNT=\$(cat $TMPFILE);\
  [ \$CNT -le 0 ] && echo "時間です" || echo \$CNT;\
  CNT=\$(expr \$CNT - 1) ;\
  echo \$CNT > $TMPFILE;"

trap "rm -f ${TMPFILE}" 0 1 2 3 4 5 6 8 9 11 15
