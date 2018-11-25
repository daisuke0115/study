#!/bin/bash -x
WARRNING=80
ERROR=90
INTERBAL=600


vmstat 1 2 |tail -n 1 | awk '{print $15}'
