#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Ошибка: укажите файл с оценками и порог"
    exit 1
fi

file="$1"
threshold="$2"

if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

awk -F '\t' -v threshold="$threshold" '
$2 > threshold {
    print $3 "\t" $1 "\t" $2
}
' "$file" | sort -k1,1
