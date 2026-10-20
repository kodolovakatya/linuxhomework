#!/bin/bash

for i in {10..1}; do
    stars=$(printf "%${i}s" | tr ' ' '*')

    echo -ne "\rОсталось: $i $stars"

    sleep 1
done

echo -e "\rГотово!                    "
