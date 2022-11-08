#!/bin/bash
if [ $# '==' 0 ]; then
    echo "Usage: units.sh #bytes"
    exit 1
fi

if [ $# '==' 1 ]; then
    if [ $1 '-lt' 1000 ]; then
    echo "$1 bytes"
    echo "$1 bytes"
    elif [ $1 '-lt' 1000000 ] ; then
        echo $(awk -v a=$1 'BEGIN {print a * 0.001}') "kbytes"
        echo $(awk -v a=$1 'BEGIN {printf "%0.3f", a * 0.976562 / 1000}') "Kibytes"
    elif [ $1 '-ge' 1000000 ] && [ $1 '-lt' 1000000000 ]; then
        echo $(awk -v a=$1 'BEGIN {printf "%0.3f", (a - a % 1000) * 0.000001}') "Mbytes"
        echo $(awk -v a=$1 'BEGIN {printf "%.3f", a * 0.00095367431640625 / 1000}') "Mibytes"
    elif [ $1 '-ge' 1000000000 ] && [ $1 '-lt' 1000000000000 ]; then
        echo $(awk -v a=$1 'BEGIN {printf "%0.3f", a * 0.000000001}') "Gbytes"
        echo $(awk -v a=$1 'BEGIN {printf "%0.3f", a * 0.000953674 / 1000}') "Gibytes"
    elif [ $1 '-ge' 1000000000000 ]; then
        echo $(awk -v a=$1 'BEGIN {printf "%0.3f", (a - a % 1000000000) * 0.000000000001}') "Tbytes"
        echo $(awk -v a=$1 'BEGIN {printf "%0.3f", a * 0.00000000090949470177293 / 1000}') "Tibytes"
    else
        echo " Error"
        exit 1
    fi
else
    echo " Error"
    exit 1
fi