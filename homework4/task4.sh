#!/bin/bash

sed 's/[{}"]//g; s/ //g; s/:/=/g; s/,/\n/g' homework4/config.json > homework4/config_clean.txt

awk '{print "CONF_" $0}' homework4/config_clean.txt > homework4/config_final.txt

for line in $(cat homework4/config_final.txt); do
    export "$line"
    echo "Экспортировано: $line"
done
