#!/bin/bash

mkdir -p task11_files
cd task11_files

touch image1.jpg image2.png doc1.txt doc2.pdf script.sh archive.tar.gz

mkdir -p images
mkdir -p documents
mkdir -p scripts
mkdir -p archives

for file in *; do
    if [ -f "$file" ]; then

        if [[ "$file" == *.jpg || "$file" == *.png ]]; then
            mv "$file" images/

        elif [[ "$file" == *.txt || "$file" == *.pdf ]]; then
            mv "$file" documents/

        elif [[ "$file" == *.sh ]]; then
            mv "$file" scripts/

        elif [[ "$file" == *.tar.gz ]]; then
            mv "$file" archives/
        fi

    fi
done

ls -R
