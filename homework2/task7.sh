#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите один путь"
    exit 1
fi

path="$1"

if [ ! -e "$path" ]; then
    echo "Ошибка: файл или директория не существует"
    exit 1
fi

if [ -d "$path" ]; then
    echo "Содержимое директории:"
    ls -la -- "$path"

elif [ -f "$path" ]; then
    echo "Информация о файле:"
    ls -l -- "$path"

    echo "Количество строк:"
    wc -l < "$path"

else
    echo "Ошибка: неподдерживаемый тип файла"
    exit 1
fi
