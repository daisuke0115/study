#!/bin/bash -x
OUTPUT_FILE=/tmp/shell_02.tmp
cat /dev/null > $OUTPUT_FILE
ls -l >> $OUTPUT_FILE 2>&1
ls -l aaaa >> $OUTPUT_FILE 2>&1
