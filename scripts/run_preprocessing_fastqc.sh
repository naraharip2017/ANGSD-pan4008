#!/bin/bash -l

conda activate angsd

for sample in SRR* 
do

    cd "${sample}"
    srr_id=${sample%%_*}

    fastqc "${srr_id}_1.fastq.gz" "${srr_id}_2.fastq.gz" --threads 2 --extract

    cd ..

done