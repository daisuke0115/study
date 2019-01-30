#!/bin/bash

shell_name=${1}
shell_text="#!/bin/bash"

if [ $# = 1 ] ;then
        echo ${shell_text} >${shell_name} 
else echo "usage:$0 [shell_name]"
        exit 1
fi

if [ -r ${shell_name} ] ;then
        chmod 755 ${shell_name}
else echo "${shell_name} not find"
        exit 1
fi
echo "${shell_name} was created"
exit 0
