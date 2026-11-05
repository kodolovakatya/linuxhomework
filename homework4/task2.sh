#!/bin/bash

for category in $(awk -F',' '$1 != "ID" {print $3}' homework4/products.csv | sort | uniq); do
    awk -F',' -v category="$category" '$3 == category {sum += $4 * $5} END {print category, sum}' homework4/products.csv
done | sort -k2nr

sed '/,0$/d' homework4/products.csv > homework4/available_products.csv

while read line; do
    echo "$line" | awk -F',' '$1 != "ID" && $4+0 > 100 {print $2}'
done < homework4/available_products.csv
