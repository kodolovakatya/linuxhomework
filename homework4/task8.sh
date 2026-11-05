#!/bin/bash

mkdir -p logs

for i in {1..10}; do
    number=$(printf "%02d" "$i")
    echo "Это лог номер $i" > logs/log_${number}.txt
done

for file in logs/*.txt; do
    cat "$file"
done

for i in {1..10}; do
    if [ $((i % 2)) -eq 0 ]; then
        number=$(printf "%02d" "$i")
        rm logs/log_${number}.txt
    fi
done
