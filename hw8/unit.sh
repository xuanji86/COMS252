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
        let "a = $1 * 0.001"
        let "g = $1 * 0.976562"
        let "h = $g / 1000"
        printf "%.3f %s\n" "$a" "kbytes"
        printf "%.3f %s\n" "$h" "Kibytes"
    elif [ $1 '-ge' 1000000 ] && [ $1 '-lt' 1000000000 ]; then
        let "a = ($1 - $1 % 1000) * 0.000001"
        let "g = $1 * 0.00095367431640625"
        let "h = $g / 1000"
        printf "%.3f %s\n" "$a" "Mbytes"
        printf "%f %s\n" "$g" "Mibytes"
    elif [ $1 '-ge' 1000000000 ] && [ $1 '-lt' 1000000000000 ]; then
        let "a = $1 * 0.000000001"
        let "g = $1 * 0.000953674"
        let "h = $g / 1000"
        printf "%.3f %s\n" "$a" "Gbytes"
        printf "%.3f %s\n" "$h" "Mibytes"
    elif [ $1 '-ge' 1000000000000 ]; then
        let "a = ($1 - $1 % 1000000000) * 0.000000000001"
        let "g = $1 * 0.00000000090949470177293 - ($1 * 0.00000000090949470177293) % 1"
        let "h = g / 1000"
        printf "%.3f %s\n" "$a" "Tbytes"
        printf "%.3f %s\n" "$h" "Tibytes"
    else
        echo " Error"
        exit 1
    fi
else
    echo " Error"
    exit 1
fi