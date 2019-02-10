#!/bin/bash
set -ue

shell_name=$1
shell_text="#!/bin/bash"

# check
if [ $# != 1 ] ;then
        echo "usage:$0 [shell_name]"
        exit 1
fi
if [ -f ${shell_name} ] ;then
        echo "${shell_name} is alrady exists. Do you want to overwrite?(y/n)"
        read INPUT
        if [ $INPUT != "y" ] ;then
                echo "Can't create Script."
                exit 1
        fi
fi

# main
echo ${shell_text} >${shell_name} 

if [ -r ${shell_name} ] ;then
        chmod 755 ${shell_name}
else echo "${shell_name} not found"
        exit 1
fi
echo "${shell_name} was created"
exit 0
