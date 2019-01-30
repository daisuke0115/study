#!/bin/bash

shell_name=${1}
shell_text="#!/bin/bash"

if [ $# = 1 ] ;then
        echo ${shell_text} >${shell_name} 
else echo "usage:$0 [shell_name]"
        exit 1
fi

chmod 755 ${shell_name}
