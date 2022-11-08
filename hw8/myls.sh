#!/bin/bash
counts=0
for i in $@; do
    if [ -d $i ]; then
        # echo "/ $i"
        printf "              /  %s\n" $i

    elif [ -f $i ]; then
        # echo $(wc -c < $i) $i
        printf "%15s  %s\n" $(wc -c < $i) $i
        counts=$(($counts + $(wc -c < $i)))
    fi
done

echo "===============  ========================================"
if [ $counts -gt 0 ]; then
    printf "%15d  Total bytes\n" $counts
fi