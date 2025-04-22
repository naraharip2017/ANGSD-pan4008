#!/bin/bash -l

mkdir rseqc

referenceBed="refGene.bed"

for sample in SRR* 
do

    srr_id=${sample%%_*}

    bamFile="${sample}/${srr_id}.Aligned.sortedByCoord.out.bam"

    conda activate angsd

    samtools index "${bamFile}"

    conda activate rseqc
        
    read_distribution.py -i "${bamFile}" -r "${referenceBed}" > "rseqc/${sample}_read_distribution.txt"

    geneBody_coverage.py -i "${bamFile}" -r "${referenceBed}" -o "rseqc/${sample}_geneBody_coverage"

done