#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите путь до директории"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Ошибка: директория не существует"
    exit 1
fi

current_date=$(date +%Y-%m-%d)

mkdir -p "$directory/backup"

for file in "$directory"/*.txt; do
    [ -e "$file" ] || continue

    filename=$(basename "$file" .txt)

    cp "$file" "$directory/backup/${filename}_${current_date}.txt"

    echo "Создана резервная копия: ${filename}_${current_date}.txt"
done
