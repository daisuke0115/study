#!/bin/bash -x
vmstat 1 2 |tail -n 1 | awk '{print $15}'
