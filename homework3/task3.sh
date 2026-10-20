#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите путь до текстового файла"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

tr -cs '[:alpha:]' '\n' < "$file" | \
tr '[:upper:]' '[:lower:]' | \
sort | \
uniq -c | \
sort -nr | \
head -10
