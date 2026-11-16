#!/bin/bash

mkdir -p homework5/terminal_task/results

input="homework5/data/gencode.v41.basic.annotation.gff3"

paste \
<(awk '$3 == "gene" && $9 ~ /gene_type=unprocessed_pseudogene/' "$input" | cut -f1,4,5,7) \
<(awk '$3 == "gene" && $9 ~ /gene_type=unprocessed_pseudogene/' "$input" | cut -f9 | sed 's/.*gene_name=\([^;]*\).*/\1/') \
> homework5/terminal_task/filtered.tsv

awk 'BEGIN{OFS="\t"}
{
    if ($4 == "+")
        print $1, $2, $2+1, $4, $5
    else if ($4 == "-")
        print $1, $3, $3+1, $4, $5
}' homework5/terminal_task/filtered.tsv \
> homework5/terminal_task/results/result.tsv
