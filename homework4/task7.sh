#!/bin/bash

mkdir my_project

mkdir my_project/src
mkdir my_project/docs
mkdir my_project/tests
mkdir my_project/build

for dir in src docs tests build; do
    mkdir my_project/$dir/images
    mkdir my_project/$dir/scripts
    mkdir my_project/$dir/data
done

for dir in my_project/* my_project/*/*; do
    if [ -d "$dir" ]; then
        echo "Создана директория: $dir"
    fi
done

touch my_project/README.md
