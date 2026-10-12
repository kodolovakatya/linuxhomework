#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Ошибка: необходимо ввести 2 аргумента"
    exit 1
fi

file="$1"
organism="$2"

if [ ! -f "$file" ]; then
    echo "Ошибка: файл не существует"
    exit 1
fi

case "$organism" in
    human|mouse|rat|fly)
        echo "Обрабатываю $(basename "$file")"
        ;;
    *)
        echo "Ошибка: организм не поддерживается"
        echo "Поддерживаемые организмы: human, mouse, rat, fly"
        exit 1
        ;;
esac
