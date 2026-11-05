#!/bin/bash

touch document1.txt document2.txt document3.txt document4.txt document5.txt

mkdir -p renamed

ls document*.txt | while read file; do
    new_name=$(echo "$file" | sed 's/document/file/')
    mv "$file" "renamed/$new_name"
done

ls renamed
