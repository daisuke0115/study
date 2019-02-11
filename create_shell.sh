#!/bin/bash
set -ue

trap "echo $(basename $0) was ended. RC=$?" 0 1 2 3 4 5 6 8 9 11 15
shell_name=${1:?usage:$0 [shell_name]}
shell_text="#!/bin/bash"

# check
#if [ $# != 1 ] ;then
#        echo "usage:$0 [shell_name]"
#        exit 1
#fi
if [ -f ${shell_name} ] ;then
        echo "${shell_name} is alrady exists. Do you want to overwrite?(y/n)"
        read INPUT
        if [ $INPUT != "y" ] ;then
                echo "Can't create Script."
                exit 1
        fi
fi

# main
echo "${shell_text}
set -ue" >${shell_name} 

if [ -r ${shell_name} ] ;then
        chmod 755 ${shell_name}
else echo "${shell_name} not found"
        exit 1
fi
echo "${shell_name} was created"
exit 0
