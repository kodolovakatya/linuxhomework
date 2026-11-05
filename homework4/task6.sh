#!/bin/bash

sed 's/;/,/g; s/"//g' homework4/data.csv > homework4/data_fixed.csv

awk -F',' '{
    print "Строка " NR ": " NF " полей"
    if (NF != 3)
        print "ОШИБКА:", $0
}' homework4/data_fixed.csv

while read line; do
    echo "$line" | awk -F',' '$1 != "Name" {
        print "Hello, my name is " $1 ". I am " $2 " years old and I live in " $3 "."
    }'
done < homework4/data_fixed.csv
