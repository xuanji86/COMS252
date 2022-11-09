#!/bin/bash

for i in $@; do
    sed -i 's/$/&,/g' $i > $i
done
