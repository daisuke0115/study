#!/bin/bash -x
# decimal number to hexadecimal
# usage: $0 number
num=${1}

case "$num" in
  0x[0-9a-f]* ) echo "$num is `printf "%d" $num`"; ;;
  [0-9]*      ) echo "$num is `printf "0x%x" $num`" ;;
  *           ) echo "Unknown Decimal" ;;
esac
exit 0
