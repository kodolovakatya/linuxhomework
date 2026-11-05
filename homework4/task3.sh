#!/bin/bash

df -h | awk 'NR > 1 {print $1, $5}' > homework4/disk_usage.txt

sed 's/%//g; s/dev/device/g' homework4/disk_usage.txt > homework4/disk_usage_formatted.txt

for filesystem in $(awk '{print $1}' homework4/disk_usage_formatted.txt); do
    awk -v fs="$filesystem" '$1 == fs && $2 > 80 {print "WARNING:", $1, "usage is", $2 "%"}' homework4/disk_usage_formatted.txt
done
