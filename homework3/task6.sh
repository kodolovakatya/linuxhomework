#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Ошибка: укажите хотя бы один хост"
    exit 1
fi

for host in "$@"; do
    echo "Проверка $host"

    if ping -c 1 "$host" > /dev/null 2>&1; then
        echo "$host доступен"
    else
        echo "$host недоступен"
    fi

    echo
done
