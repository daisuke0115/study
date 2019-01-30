#/bin/bash -x
param=${#}

case $param in
  1) echo "argument is 1";;
  2) echo "arbument is 2";;
  *) echo "Please specify correct argument";;
esac
