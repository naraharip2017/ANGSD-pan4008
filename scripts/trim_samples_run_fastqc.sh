#!/bin/bash -l

for sample in SRR*
do

    cd "${sample}"
    srr_id=${sample%%_*}

    conda activate trim-galore
    trim_galore --illumina --paired -o trimmed/ ${srr_id}_1.fastq.gz ${srr_id}_2.fastq.gz

    conda activate angsd
    fastqc trimmed/${srr_id}_1_val_1.fq.gz trimmed/${srr_id}_2_val_2.fq.gz --threads 2 --extract

    cd ..
done
