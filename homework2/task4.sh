#!/bin/bash

file="$1"

if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите путь к одному файлу"
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

first_line=$(head -n 1 "$file")

if [[ "$first_line" != ">"* ]]; then
    echo "Ошибка: это не FASTA-файл"
    exit 1
fi

if ! tail -n +2 "$file" | grep -qE '^[A-Za-z*.-]+$'; then
    echo "Ошибка: в файле не найдена последовательность"
    exit 1
fi

echo "Файл похож на FASTA"
