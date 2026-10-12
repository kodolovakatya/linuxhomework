#!/bin/bash

file="$1"

if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите один файл"
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

name=$(basename "$file")

if [ -e "$name" ] || [ -L "$name" ]; then
    echo "Ошибка: файл или ссылка с таким именем уже существует"
    exit 1
fi

ln -s -- "$file" "$name"

echo "Символическая ссылка $name создана"
