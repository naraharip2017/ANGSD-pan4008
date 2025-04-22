#!/bin/bash -l

conda activate angsd

for sample in SRR*
do
    cd $sample
    srr_id=${sample%%_*}

    STAR --runMode alignReads --runThreadN 50 \
         --genomeDir ../Mus_musculus_STARindex \
         --readFilesIn trimmed/${srr_id}_1_val_1.fq.gz trimmed/${srr_id}_2_val_2.fq.gz \
         --readFilesCommand zcat \
         --outFileNamePrefix ${srr_id}. \
         --outSAMtype BAM SortedByCoordinate \
         --alignIntronMax 100000
    cd ..

done