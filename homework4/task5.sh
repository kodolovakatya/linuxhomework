#!/bin/bash

sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/; s/[[:punct:]]/ /g' \
homework4/text.txt > homework4/text_clean.txt

awk '{
    for (i=1; i<=NF; i++)
        count[$i]++
}
END {
    for (word in count)
        print word, count[word]
}' homework4/text_clean.txt | sort -k2nr | head -5 | \
awk '{print $1 ": " $2}' > homework4/top5.txt

cat homework4/top5.txt

for word in $(cut -d':' -f1 homework4/top5.txt); do
    echo "Definition for $word:"
    curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$word"
    echo
done
