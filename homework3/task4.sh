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

echo "Отчет о директории: $directory"
echo
echo "Количество файлов по типам:"

for file in "$directory"/*; do
    [ -f "$file" ] || continue

    name=$(basename "$file")

    if [[ "$name" == *.* ]]; then
        echo "${name##*.}"
    else
        echo "без_расширения"
    fi
done | sort | uniq -c

echo
echo "Общий размер директории:"
du -sh "$directory"
