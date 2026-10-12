#!/bin/bash

file="$1"
old_ext="$2"
new_ext="$3"

if [[ "$old_ext" != "txt" && "$old_ext" != "pdf" && "$old_ext" != "doc" ]]; then
    echo "Ошибка: неподдерживаемое расширение"
    echo "Поддерживаемые форматы: txt, pdf, doc"
    exit 1
fi

if [[ "$new_ext" != "txt" && "$new_ext" != "pdf" && "$new_ext" != "doc" ]]; then
    echo "Ошибка: неподдерживаемое расширение"
    echo "Поддерживаемые форматы: txt, pdf, doc"
    exit 1
fi

if [[ ! -f "$file" ]]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

if [[ "$file" != *."$old_ext" ]]; then
    echo "Ошибка: фактическое расширение файла не совпадает с указанным"
    exit 1
fi

new_file="${file%.*}.$new_ext"

mv -- "$file" "$new_file"

echo "Файл переименован: $file -> $new_file"
