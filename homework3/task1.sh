#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Ошибка: укажите один файл"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

extension="${file##*.}"

if [ "$extension" = "csv" ]; then
    separator=","
elif [ "$extension" = "tsv" ]; then
    separator=$'\t'
else
    echo "Ошибка: поддерживаются только CSV и TSV файлы"
    exit 1
fi

awk -F "$separator" '
NR == 1 {
    columns = NF
}

NF != columns {
    print "Ошибка: строка " NR " содержит " NF " столбцов вместо " columns
    error = 1
}

END {
    if (error == 1)
        exit 1
    else
        print "Файл корректен: количество столбцов во всех строках одинаковое"
}
' "$file"
