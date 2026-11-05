#!/bin/bash

awk '{print $1, $9}' homework4/access.log > homework4/status_codes.txt

grep ' 4[0-9][0-9] ' homework4/access.log | \
sed 's/ 4[0-9][0-9] / CLIENT_ERROR /' > homework4/errors.log

for ip in $(cut -d' ' -f1 homework4/status_codes.txt | sort | uniq); do
    count=$(grep "^$ip " homework4/status_codes.txt | wc -l)
    echo "$ip: $count запросов"
done
